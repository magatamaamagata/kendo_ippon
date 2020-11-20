require 'rails_helper'

RSpec.describe 'コメント投稿', type: :system do
  before do
    @skill = FactoryBot.create(:skill)
    @compare = FactoryBot.create(:compare)
    @comment = FactoryBot.build(:comment)
  end
  context "コメントできる時" do
    it 'ログインしたユーザーはツイート詳細ページでコメント投稿できる' do
      # ログインする
      sign_in(@skill.user)
      # 投稿詳細ページに遷移する
      visit skill_path(@skill)
      # コメント用のフォームが存在することを確認する
      expect(page).to have_selector 'form'
      # フォームに情報を入力する
      fill_in 'comment', with: @comment
      # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Comment.count }.by(1)
      # 詳細ページにリダイレクトされることを確認する
      expect(current_path).to eq skill_path(@skill)
      # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
      expect(page).to have_content @comment
    end
  end
  context "コメントできない時" do
    it 'ログインしていないユーザーはコメント投稿できない' do
      # 投稿詳細ページに遷移する
      visit skill_path(@skill)
      # フォーム欄には「コメントの投稿には新規登録/ログインが必要です」が表示されていることを確認する
      expect(page).to have_content 'コメントの投稿には新規登録/ログインが必要です'
    end
  end
end