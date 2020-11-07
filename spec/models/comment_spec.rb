require 'rails_helper'
RSpec.describe Comment, type: :model do
  describe 'コメント投稿' do
  before do
    @comment = FactoryBot.build(:comment)
  end

    context 'コメント投稿がうまくいくとき' do
      it 'コメントが存在すれば登録できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿がうまくいかないとき' do
      it 'コメントが空だと投稿できない' do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Textを入力してください')
      end
      
      it 'コメントが140文字以上だと投稿できない' do
        @comment.text = Faker::Lorem.characters(number: 141)
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Textは140文字以内で入力してください')
      end
    end
  end
end
