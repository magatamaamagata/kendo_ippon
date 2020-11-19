require 'rails_helper'

      # compareページに移動することを確認
      # expect(current_path).to eq new_skill_compare_path(@skill)
      # 動画とそれに紐づいたyoutube動画が再生される
      # aタグをクリックしても遷移しないでとどまる
      # フォームに情報を入力する
      fill_in '良いところ', with: @skill.compare.amagata
      fill_in '比較した結果差があると感じたこと', with: @skill.compare.problem
      fill_in '改善すること、次回の稽古で試してみること', with: @skill.compare.make_better
      fill_in 'その他気づいたこと', with: @skill.compare.notice
      find("option[value='#{@skill.compare.public_id}']").select_option
      # 送信した値がDBに保存されていることを確認する
      expect{
        click_button "投稿する"
      }.to change { Compare.count }.by(1)
      # 詳細ページに遷移することを確認する
      expect(current_path).to eq skill_path(@skill)
      # 詳細ページには先ほど投稿した内容の投稿が存在することを確認する（動画）
      expect(page).to have_selector("video")
      # 詳細ページには先ほど投稿した内容の投稿が存在することを確認する（テキスト）
      expect(page).to have_content(@skill.compare.amagata)
      expect(page).to have_content(@skill.compare.problem)
      expect(page).to have_content(@skill.compare.make_better)
      # トップページに移動する
      visit root_path
      # トップページには先ほど投稿した内容の投稿が存在することを確認する（動画）
      expect(page).to have_selector("video")
      # トップページには先ほど投稿した内容の投稿が存在することを確認する（テキスト）
      expect(page).to have_content(@skill.compare.amagata)
      expect(page).to have_content(@skill.compare.problem)
      expect(page).to have_content(@skill.compare.make_better)
