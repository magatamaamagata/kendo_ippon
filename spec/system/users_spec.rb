require 'rails_helper'

# def basic_pass(path)
#   username = ENV["BASIC_AUTH_USER"]
#   password = ENV["BASIC_AUTH_PASSWOR"]
#   visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
# end

RSpec.describe 'ユーザー登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # #ベーシック認証をパス
      # basic_pass root_path
      #トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')

      # 新規登録ページへ移動する
      visit new_user_registration_path

      # ユーザー情報を入力する
      fill_in 'name', with: @user.nickname
      fill_in 'Email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password_confirmation', with: @user.password_confirmation
      find("option[value='#{@user.grade_id}']").select_option

      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)

      # トップページへ遷移することを確認する
      expect(current_path).to eq root_path

      # ログアウトボタンがあることを確認する
      expect(page).to have_content('ログアウト')

      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      #トップページに移動する
      visit root_path

      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')

      # 新規登録ページへ移動する
      visit new_user_registration_path

      # ユーザー情報を入力する
      fill_in 'name', with: ""
      fill_in 'Email', with: ""
      fill_in 'password', with: ""
      fill_in 'password_confirmation', with: ""
      find("option[value='1']").select_option

      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)

      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq "/users"
    end
  end
end

  RSpec.describe "ログイン処理", type: :system do
    before do
      @user = FactoryBot.create(:user)
    end
  
    context "ログインができるとき" do
      it "正しい情報を入力するとログインができてトップページに遷移しログアウトもできる" do
        # トップページに移動する
        visit root_path
        # トップページにサインインページへ遷移するボタンがあることを確認する
        expect(page).to have_content('ログイン')
        # ログインページへ移動する
        visit new_user_session_path
        # ユーザー情報を入力する
        fill_in "Email", with: @user.email
        fill_in "パスワード", with: @user.password
        # ログインボタンを押す
        find('input[name="commit"]').click
        # トップページへ遷移する
        expect(current_path).to eq root_path
        # ログアウトボタンと、New Protoへ遷移するボタンが表示されていることを確認する
        expect(page).to have_content("ログアウト")
        expect(page).to have_content(@user.nickname)
        # ログアウトボタンを押すとログアウトしてトップページに戻ることを確認する
        click_on "ログアウト"
        expect(current_path).to eq root_path
      end
    end
    context "ログインできないとき" do
      it "誤った情報ではその場にとどまる" do
        # トップページに移動する
        visit root_path
        # トップページにログインページへ遷移するボタンがあることを確認する
        expect(page).to have_content('ログイン')
        # ログインページへ遷移する
        visit new_user_session_path
        # ユーザー情報を入力する
        fill_in "Email", with: ""
        fill_in "パスワード", with: ""
        # ログインボタンを押す
        find('input[name="commit"]').click
        # ログインページへ戻されることを確認する
        expect(current_path).to eq new_user_session_path
        #トップページへ移動する
        visit root_path
        # トップページにサインアップページ,サインインページへ遷移するボタンがあることを確認する
        expect(page).to have_content('ログイン')
        expect(page).to have_content('新規登録')
      end
    end
  end
  
  RSpec.describe 'ユーザー詳細ページ', type: :system do
    before do
      @user = FactoryBot.create(:user)
      @skill = FactoryBot.create(:skill)
      @compare = FactoryBot.create(:compare)

    end
    context "ユーザー詳細ページに遷移できる" do
      it "ユーザー名をクリックすると詳細ページへ遷移し、詳細情報、投稿した動画が表示されている" do
        # ログインする
        sign_in(@skill.user)
        # リンクがあるユーザー名を確認
        expect(page).to have_link "#{@skill.user.nickname}", href: "/users/#{@skill.user.id}"
        # 移動
        visit user_path(@skill.user)
        # ユーザー詳細ページにユーザ情報が記載されているか確認
        expect(page).to have_content(@skill.user.nickname)
        expect(page).to have_content(@skill.user.email)
        expect(page).to have_content(@skill.user.grade.name)
        # 動画も表示されている
        expect(page).to have_content(@skill.youtube.name)
        expect(page).to have_selector("video")
      end
    end
    context "ユーザー詳細ページが表示されない" do
      #なし
    end
  end

  RSpec.describe "編集機能", type: :system do
    before do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @skill1 = FactoryBot.create(:skill)
      @skill2 = FactoryBot.create(:skill)
    end
    context 'ユーザー編集ができるとき' do
      it 'ログインしたユーザーはユーザー情報の編集ができる' do
        # ログインする
        sign_in(@user1)
        # トップページに戻ったか確認
        expect(current_path).to eq root_path
        # ユーザー詳細ページへ遷移する
        visit user_path(@user1)
        # 詳細ページに「編集」ボタンがあることを確認する
        expect(page).to have_link 'プロフィールを編集する', href: "/users/#{@user1.id}/edit"
        # 編集ページへ遷移する
        visit edit_user_path(@user1)
        
        # すでにユーザーの内容がフォームに入っていることを確認する
        visit edit_user_path(@user1)
        expect(find_field(id: 'name').value).to eq @user1.nickname
        expect(find_field(id: 'email').value).to eq @user1.email
        expect(find_field(id: 'grade').value.to_i).to eq @user1.grade_id
        # 投稿内容を編集する
        visit edit_user_path(@user1)
        fill_in "name", with: @user1.nickname
        fill_in "email", with: @user1.email
        fill_in "password", with: @user1.password
        fill_in "password_confirmation", with: @user1.password_confirmation
        # binding.pry
        # 編集してもuserモデルのカウントは変わらないことを確認する
        expect{find('input[name="commit"]').click}.to change { Skill.count }.by(0)
        # トップページには先ほど変更した内容の投稿が存在することを確認する（ニックネーム）
        expect(page).to have_content(@user1.nickname)
      end
    end


    context "編集ができない時" do
      it 'ログインしたユーザーは自分以外が投稿したユーザー情報の編集画面には遷移できない' do
        # ユーザー情報1のユーザーでログインする
        sign_in(@skill1.user)
        # ユーザー情報2のユーザー詳細ページへいく
        visit user_path(@user2)
        # ユーザー情報2に「編集」ボタンがないことを確認する
        expect(page).to have_no_link 'プロフィールを編集する', href: edit_skill_path(@skill2)
        # 直接編集ページに行こうとしてもトップページにリダイレクトする
        visit edit_skill_path(@skill2)
        expect(current_path).to eq root_path
      end

      it 'ゲストユーザーはユーザー情報の編集画面には遷移できない' do
        #トップページへ
        visit root_path
        # ゲストユーザーでログインする
        expect(page).to have_link 'ゲストログイン', href: '/users/guest_sign_in'
        click_link 'ゲストログイン'
        # ユーザー情報2に「編集」ボタンがないことを確認する
        expect(page).to have_no_link 'プロフィールを編集する', href: edit_skill_path(@skill2)
        # 直接編集ページに行こうとしても詳細ページにリダイレクトする
        visit edit_skill_path(@skill2)
        gest = User.find_by(email: "guest@example.com")
        redirect_to user_path(gest)
      end

      it 'ログインしていないとユーザーの詳細ページにいけない' do
        # ユーザー1詳細ページに移動する
        visit user_path(@user1)
        # 詳細ページへ行こうとするとログインページに遷移する
        expect(current_path).to eq new_user_session_path
      end

      it "ログインしているが誤った情報ではそのページにとどまる" do
        # ログインする
        sign_in(@user1)
        # 空の情報に変更
        visit edit_user_path(@user1)
        fill_in "name", with: ""
        fill_in "email", with: ""
        fill_in "password", with: ""
        fill_in "password_confirmation", with: ""
        find('input[name="commit"]').click
        # ページにとどまる
        expect(current_path).to eq user_path(@user1)
      end
    end
  end
  
  RSpec.describe "削除機能", type: :system do
    before do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @skill1 = FactoryBot.create(:skill)
      @skill2 = FactoryBot.create(:skill)
    end

    context "削除する" do
      it "削除できることを確認" do
        # ログインする
        sign_in(@skill1.user)
        # ユーザー詳細ページに移動する
        visit user_path(@skill1.user)
        # 「削除する」ボタンがあることを確認する
        expect(page).to have_link 'プロフィールを削除する', href: user_path(@skill1.user)
        # 削除する
        expect{find_link('プロフィールを削除する', href: user_path(@skill1.user)).click}.to change { User.count }.by(-1)
        # トップページに遷移することを確認
        expect(current_path).to eq root_path
        # トップページには投稿1の内容が存在しないことを確認する（動画）
        expect(page).to have_no_link href: skill_path(@skill1)
        # トップページには投稿1の内容が存在しないことを確認する（テキスト）
        expect(page).to have_no_content(@skill1.user.grade_id)
      end
    end

    context 'ユーザー削除ができないとき' do
      it 'ログインしたユーザーは自分以外のユーザーを削除ができない' do
        # ユーザー1でログインする
        sign_in(@skill1.user)
        # ユーザー2詳細ページに移動する
        visit user_path(@skill2.user)
        # ユーザー2詳細ページに「削除」ボタンが無いことを確認する
        expect(page).to have_no_link 'プロフィールを削除する', href: user_path(@skill2.user)
      end

      it 'ログインしていないとユーザーの詳細ページにいけない' do
        # ユーザー1詳細ページに移動する
        visit user_path(@user1)
        # 詳細ページへ行こうとするとログインページに遷移する
        expect(current_path).to eq new_user_session_path
      end

      it 'ゲストユーザーはユーザー情報の削除画面には遷移できない' do
        #トップページへ
        visit root_path
        # ゲストユーザーでログインする
        expect(page).to have_link 'ゲストログイン', href: "/users/guest_sign_in"
        click_link 'ゲストログイン'
        # ユーザー情報2に「削除」ボタンがないことを確認する
        expect(page).to have_no_link 'プロフィールを削除する', href: user_path(@skill1.user)
      end
    end
  end