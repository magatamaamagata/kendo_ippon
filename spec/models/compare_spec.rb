require 'rails_helper'
RSpec.describe Compare,type: :model do
  describe 'ユーザー感想投稿' do
  before do
    @compare = FactoryBot.build(:compare)
    @long_sentence = Faker::Lorem.characters(number: 500)

  end

    context '感想投稿がうまくいくとき' do
      it '全て入力されていれば登録できる' do
        expect(@compare).to be_valid
      end

      it '気づきがなくても登録できる' do
        @compare.notice = ''
        expect(@compare).to be_valid
      end
    end

    context '感想投稿がうまくいかないとき' do
      it '継続することが空だと登録できない' do
        @compare.keep = ""
        @compare.valid?
        expect(@compare.errors.full_messages).to include('継続することを入力してください')
      end
      it '継続することが400字を超えていると登録できない' do
        @compare.keep = @long_sentence
        @compare.valid?
        expect(@compare.errors.full_messages).to include('継続することは400文字以内で入力してください')
      end
      it '問題点が空だと登録できない' do
        @compare.problem = ""
        @compare.valid?
        expect(@compare.errors.full_messages).to include('問題点を入力してください')
      end
      it '問題点が400字を超えていると登録できない' do
        @compare.problem = @long_sentence
        @compare.valid?
        expect(@compare.errors.full_messages).to include('問題点は400文字以内で入力してください')
      end
      it '改善することが空だと登録できない' do
        @compare.make_better = ""
        @compare.valid?
        expect(@compare.errors.full_messages).to include('改善することを入力してください')
      end

      it '改善することが400字を超えていると登録できない' do
        @compare.make_better = @long_sentence
        @compare.valid?
        expect(@compare.errors.full_messages).to include('改善することは400文字以内で入力してください')
      end
      it '気付きが400字を超えていると登録できない' do
        @compare.notice = @long_sentence
        @compare.valid?
        expect(@compare.errors.full_messages).to include('気がついたことは400文字以内で入力してください')
      end

      it '公開設定を選択していないと登録できない' do
        @compare.public_id = 1
        @compare.valid?
        expect(@compare.errors.full_messages).to include('公開設定を選択してください')
      end
    end
  end
end
