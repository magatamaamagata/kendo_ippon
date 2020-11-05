require 'rails_helper'
RSpec.describe Comment, type: :model do
  describe 'コメント投稿' do
  before do
    @comment = Comment.new(text: Faker::Lorem.characters(number: 140), user_id: 1 ,skill_id: 2)
  end

    context 'コメント投稿がうまくいくとき' do
      it 'コメントが存在すれば登録できる' do
        @comment.valid?
        # expect().to be_valid
      end
    end

    context 'コメント投稿がうまくいかないとき' do
      it 'コメントが空だと投稿できない' do
        @comment = Comment.new(text: Faker::Lorem.characters(number: 140), user_id: 1 ,skill_id: 2)
        @comment.text = ""
        @comment.valid?
      end
      
      it 'コメントが140文字以上だと投稿できない' do
        @comment = Comment.new(text: Faker::Lorem.characters(number: 140), user_id: 1 ,skill_id: 2)
        @comment.text = Faker::Lorem.characters(number: 141)
        @comment.valid?
        expect(@comment.errors.full_messages).to include('技名を選択してください')
      end
    end
  end
end
