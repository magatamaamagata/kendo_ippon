require 'rails_helper'

# def basic_pass(path)
#   username = ENV["BASIC_AUTH_USER"]
#   password = ENV["BASIC_AUTH_PASSWOR"]
#   visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
# end

RSpec.describe 'ユーザー新規登録', type: :system do
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