require 'rails_helper'


# RSpec.describe '動画投稿', type: :system do
#   before do
#     @user = FactoryBot.create(:user)
#     @skill = FactoryBot.build(:skill)
#   end
#   context "新規投稿ができるとき" do
#     it "ログインしたユーザーは新規投稿できる" do
#       visit root_path
#       # ログインする
#       sign_in(@user)
#       # 新規投稿ページへのリンクがあることを確認する
#       expect(page).to have_content("動画をUPして記録する")
#       # 投稿ページに移動する
#       visit new_skill_path
#       # 動画選択フォームに動画を添付する
#       video_path = Rails.root.join("public/video/video.MOV")
#       # フォームに情報を入力する
#       find("option[value='#{@skill.youtube_id}']").select_option
#       # 動画選択フォームに動画を添付する
#       attach_file("skill[video]", video_path, make_visible: true)
#       # 送信した値がDBに保存されていることを確認する
#       expect{
#         click_button "比較する"
#       }.to change { Skill.count }.by(1)
#       # 詳細ページにいくことを確認する
#       @skill.save
#       expect(current_path).to eq new_skill_compare_path(@skill.id-1)
#     end
#   end

#   context "投稿ができないとき" do
#     it "ログインしていないと新規投稿ページに遷移できない" do
#       # トップページに遷移する
#       visit root_path
#       # 新規投稿ページへのリンクがあることを確認する
#       expect(page).to have_content("動画をUPして記録する")
#       # 投稿ページに移動する
#       visit new_skill_path
#       # ログインページへリダイレクトされる
#       expect(current_path).to eq new_user_session_path
#     end

#     it "ログインしているが誤った情報ではそのページにとどまる" do
#       # トップページに遷移する
#       visit root_path
#       # ログインする
#       sign_in(@user)
#       # 新規投稿ページへのリンクがあることを確認する
#       expect(page).to have_content("動画をUPして記録する")
#       # 投稿ページに移動する
#       visit new_skill_path
#       # 投稿ページにとどまる
#       find('input[name="commit"]').click
#       expect(current_path).to eq skills_path
#     end
#   end
# end

RSpec.describe '記録投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @skill = FactoryBot.create(:skill)
    @compare = FactoryBot.build(:compare)
  end
  context "新規記録投稿ができるとき" do
    it "ログインしたユーザーは新規投稿できる" do
      visit root_path
      # ログインする
      sign_in(@user)
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content("動画をUPして記録する")
      # 投稿ページに移動する
      visit new_skill_path
      # 動画選択フォームに動画を添付する
      video_path = Rails.root.join("public/video/video.MOV")
      # フォームに情報を入力する
      find("option[value='#{@compare.skill.youtube_id}']").select_option
      # 動画選択フォームに動画を添付する
      attach_file("skill[video]", video_path, make_visible: true)
      # 動画を投稿し記録ページへ遷移する
      click_button "比較する"
      # SkillモデルとCompareモデルのカウントが１上がることを確認する
      fill_in "amagata", with: @compare.amagata
      fill_in "problem", with: @compare.problem
      fill_in "make_better", with: @compare.make_better
      find("option[value='#{@compare.public_id}']").select_option
      @compare.save
      expect{find('input[name="commit"]').click}.to change { Compare.count }.by(1)
      # 投稿詳細ページにいることを確認
      expect(current_path).to eq skill_path(@compare.skill.id-1)
    end
  end

  context "記録投稿ができないとき" do
    it "ログインしていないと新規投稿ページに遷移できない" do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content("動画をUPして記録する")
      # 投稿ページに移動する
      visit new_skill_path
      # ログインページへリダイレクトされる
      expect(current_path).to eq new_user_session_path
    end

    it "ログインしているが誤った情報ではそのページにとどまる" do
      # トップページに遷移する
      visit root_path
      # ログインする
      sign_in(@user)
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content("動画をUPして記録する")
      # 投稿ページに移動する
      visit new_skill_path
      # 投稿ページにとどまる
      find('input[name="commit"]').click
      expect(current_path).to eq skills_path
    end
  end
end




# RSpec.describe '投稿詳細ページ', type: :system do
#   before do
#     # @user = FactoryBot.create(:user)
#     @skill = FactoryBot.create(:skill)
#   end
#   context "投稿詳細ページに遷移できる" do
#     it "投稿をクリックすると詳細ページへ遷移し、詳細情報、投稿した動画が表示されている" do
#       # ログインする
#       sign_in(@skill.user)
#       # リンクがある投稿を確認
#       expect(page).to have_link href: skill_path(@skill)
#       # 移動
#       visit skill_path(@skill)
#       # 投稿ページにユーザ情報が記載されているか確認
#       expect(page).to have_content(@skill.user.nickname)
#       expect(page).to have_content(@skill.youtube.name)
#       # 動画も表示されている
#       expect(page).to have_selector("video")
#     end
#   end
#   context "投稿ページが表示されない" do
#     #なし
#   end
# end

# RSpec.describe "編集機能", type: :system do
#   before do
#     @skill = FactoryBot.create(:skill)
#     @skill1 = FactoryBot.create(:skill)
#     @skill2 = FactoryBot.create(:skill)
#     @compare = FactoryBot.create(:compare)

#   end
#   context '投稿編集ができるとき' do
#     it 'ログインしたユーザーは投稿の編集ができる' do
#       # ログインする
#       sign_in(@compare.skill.user)
#       # トップページに戻ったか確認
#       expect(current_path).to eq root_path
#       # 投稿ページへ遷移する
#       visit skill_path(@compare.skill)
#       # 詳細ページに「編集」ボタンがあることを確認する
#       expect(page).to have_link '編集', href: edit_skill_path(@compare.skill)
#       # 編集ページへ遷移する
#       visit edit_skill_path(@compare.skill)
      
#       # すでに投稿内容がフォームに入っていることを確認する(フォームのビデオ保持はできていない)
#       expect(find_field(id: 'youtube-name').value.to_i).to eq @compare.skill.youtube_id

#       # 投稿内容を編集する
#       video_path = Rails.root.join("public/video/video.MOV")
#       find("option[value='#{@compare.skill.youtube_id}']").select_option
#       find('input[name="commit"]').click
#       # 編集してもskillモデルのカウントは変わらないことを確認する
#       visit edit_skill_compare_path(@compare.skill,@compare)
#       fill_in "amagata", with: @compare.amagata
#       fill_in "problem", with: @compare.problem
#       fill_in "make_better", with: @compare.make_better
#       find("option[value='#{@compare.public_id}']").select_option
#       expect{find('input[name="commit"]').click}.to change { Skill.count }.by(0).and change { Compare.count }.by(0)
#       # トップページには先ほど変更した内容の投稿が存在することを確認する（ニックネーム）
#       visit root_path
#       expect(page).to have_content(@skill1.user.nickname)
#     end
#   end


  # context "編集ができない時" do
  #   it 'ログインしたユーザーは自分以外が投稿したユーザー情報の編集画面には遷移できない' do
  #     # ユーザー情報1のユーザーでログインする
  #     sign_in(@skill1.user)
  #     # ユーザー情報2の投稿ページへいく
  #     visit skill_path(@skill2)
  #     # ユーザー情報2に「編集」ボタンがないことを確認する
  #     expect(page).to have_no_link '編集', href: edit_skill_path(@skill2)
  #     # 直接編集ページに行こうとしてもトップページにリダイレクトする
  #     visit edit_skill_path(@skill2)
  #     expect(current_path).to eq root_path
  #   end

  #   it 'ログインしていないとユーザーの詳細ページにいけない' do
  #     # ユーザー1詳細ページに移動する
  #     visit skill_path(@skill1)
  #     # 編集ページへ行こうとするとログインページに遷移する
  #     visit edit_skill_path(@skill1)
  #     expect(current_path).to eq new_user_session_path
  #   end

  #   it "ログインしているが誤った情報ではそのページにとどまる" do
  #     # ログインする
  #     sign_in(@skill1.user)
  #     # 空の情報に変更
  #     visit edit_skill_path(@skill1)
  #     find("option[value='1']").select_option
  #     find('input[name="commit"]').click
  #     # ページにとどまる
  #     expect(current_path).to eq skill_path(@skill1)
  #   end
  # end
# end

RSpec.describe "削除機能", type: :system do
  before do
    @skill1 = FactoryBot.create(:skill)
    @skill2 = FactoryBot.create(:skill)
  end

  context "削除する" do
    it "削除できることを確認" do
      # ログインする
      sign_in(@skill1.user)
      # 投稿ページに移動する
      visit skill_path(@skill1)
      # 「削除する」ボタンがあることを確認する
      expect(page).to have_link '削除', href: skill_path(@skill1)
      # 削除する
      expect{find_link('削除', href: skill_path(@skill1)).click}.to change { Skill.count }.by(-1)
      # トップページに遷移することを確認
      expect(current_path).to eq root_path
      # トップページには投稿1の内容が存在しないことを確認する（動画）
      expect(page).to have_no_link href: skill_path(@skill1)
    end
  end

  context '投稿削除ができないとき' do
    it 'ログインしたユーザーは自分以外の投稿を削除ができない' do
      # ユーザー1でログインする
      sign_in(@skill1.user)
      # ユーザー2詳細ページに移動する
      visit skill_path(@skill2)
      # ユーザー2詳細ページに「削除」ボタンが無いことを確認する
      expect(page).to have_no_link '削除', href: skill_path(@skill2)
    end
  end
end