require 'rails_helper'
RSpec.describe Post,type: :model do
  describe 'クイズ動画投稿' do
  before do
    @post = FactoryBot.build(:post)
  end

    context 'クイズ動画投稿がうまくいくとき' do
      it 'gifとクイズ解答、大会の種類が存在すれば登録できる' do
        @post.video = nil
        expect(@post).to be_valid
      end

      it '動画とクイズ解答、大会の種類が存在すれば登録できる' do
        @post.gif_url = ""
        expect(@post).to be_valid
      end

    end

    context '動画投稿がうまくいかないとき' do
      it '正誤解答が空だと登録できない' do
        @post.judge_correct_id = 1
        @post.video = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("正誤解答を選択してください")
      end
      
      it '大会のレベルが空では登録できない' do
        @post.difficulity_id = 1
        @post.video = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('大会のレベルを選択してください')
      end
      it '詳細が空だと登録できない' do
        @post.description = ""
        @post.video = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('詳細を入力してください')
      end
      it '詳細が400文字以上では登録できない' do
        @post.description = Faker::Lorem.characters(number: 401)
        @post.video = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('詳細は400文字以内で入力してください')
      end
      
      it '動画とGyazoGIFのURLが空では登録できない' do
        @post.gif_url = ""
        @post.video = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('Video or gif urlを入力してください')
      end
      
      it '動画とGyazoGIFのURLが存在すると登録できない' do
        @post.valid?
        expect(@post.errors.full_messages).to include('Video or gif urlを入力してください')
      end
    end
  end
end
