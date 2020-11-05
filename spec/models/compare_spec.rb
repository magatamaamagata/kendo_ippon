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
      it '気勢（比較）が空だと登録できない' do
        @compare.sprits = ""
        @compare.valid?
        expect(@compare.errors.full_messages).to include('気勢(上手い人との差)を入力してください')
      end
      it '気勢（比較）が140字を超えていると登録できない' do
        @compare.sprits = @long_sentence
        @compare.valid?
        expect(@compare.errors.full_messages).to include('気勢(上手い人との差)は140文字以内で入力してください')
      end
      it '気勢（改善点）が空だと登録できない' do
        @compare.sprits2 = ""
        @compare.valid?
        expect(@compare.errors.full_messages).to include('気勢(改善点)を入力してください')
      end
      it '気勢（改善点）が140字を超えていると登録できない' do
        @compare.sprits2 = @long_sentence
        @compare.valid?
        expect(@compare.errors.full_messages).to include('気勢(改善点)は140文字以内で入力してください')
      end
      it '姿勢（比較）が空だと登録できない' do
        @compare.posture = ""
        @compare.valid?
        expect(@compare.errors.full_messages).to include('姿勢(上手い人との差)を入力してください')
      end
      it '姿勢（比較）が140字を超えていると登録できない' do
        @compare.posture = @long_sentence
        @compare.valid?
        expect(@compare.errors.full_messages).to include('姿勢(上手い人との差)は140文字以内で入力してください')
      end
      it '姿勢（改善点）が空だと登録できない' do
        @compare.posture2 = ""
        @compare.valid?
        expect(@compare.errors.full_messages).to include('姿勢(改善点)を入力してください')
      end
      it '姿勢（改善点）が140字を超えていると登録できない' do
        @compare.posture2 = @long_sentence
        @compare.valid?
        expect(@compare.errors.full_messages).to include('姿勢(改善点)は140文字以内で入力してください')
      end
      it '竹刀の打突部(上手い人との差)' do
        @compare.position = ""
        @compare.valid?
        expect(@compare.errors.full_messages).to include('打突部位(上手い人との差)を入力してください')
      end
      it '竹刀の打突部(上手い人との差)が140字を超えていると登録できない' do
        @compare.position = @long_sentence
        @compare.valid?
        expect(@compare.errors.full_messages).to include('打突部位(上手い人との差)は140文字以内で入力してください')
      end
      it '竹刀の打突部(改善点)' do
        @compare.position2 = ""
        @compare.valid?
        expect(@compare.errors.full_messages).to include('打突部位(改善点)を入力してください')
      end
      it '竹刀の打突部(改善点)が140字を超えていると登録できない' do
        @compare.position2 = @long_sentence
        @compare.valid?
        expect(@compare.errors.full_messages).to include('打突部位(改善点)は140文字以内で入力してください')
      end
      it '打突部位(上手い人との差)' do
        @compare.position = ""
        @compare.valid?
        expect(@compare.errors.full_messages).to include('打突部位(上手い人との差)を入力してください')
      end
      it '打突部位(上手い人との差)が140字を超えていると登録できない' do
        @compare.position = @long_sentence
        @compare.valid?
        expect(@compare.errors.full_messages).to include('打突部位(上手い人との差)は140文字以内で入力してください')
      end
      it '打突部位(改善点)' do
        @compare.position2 = ""
        @compare.valid?
        expect(@compare.errors.full_messages).to include('打突部位(改善点)を入力してください')
      end
      it '打突部位(改善点)が140字を超えていると登録できない' do
        @compare.position2 = @long_sentence
        @compare.valid?
        expect(@compare.errors.full_messages).to include('打突部位(改善点)は140文字以内で入力してください')
      end
      it '刃筋(上手い人との差)が空だと登録できない' do
        @compare.sword = ""
        @compare.valid?
        expect(@compare.errors.full_messages).to include('刃筋(上手い人との差)を入力してください')
      end
      it '刃筋(上手い人との差)が140字を超えていると登録できない' do
        @compare.sword = @long_sentence
        @compare.valid?
        expect(@compare.errors.full_messages).to include('刃筋(上手い人との差)は140文字以内で入力してください')
      end
      it '刃筋(改善点)が空だと登録できない' do
        @compare.sword2 = ""
        @compare.valid?
        expect(@compare.errors.full_messages).to include('刃筋(改善点)を入力してください')
      end
      it '刃筋(改善点)が140字を超えていると登録できない' do
        @compare.sword2 = @long_sentence
        @compare.valid?
        expect(@compare.errors.full_messages).to include('刃筋(改善点)は140文字以内で入力してください')
      end
      it '残心(上手い人との差)空だと登録できない' do
        @compare.zanshin = ""
        @compare.valid?
        expect(@compare.errors.full_messages).to include('残心(上手い人との差)を入力してください')
      end

      it '残心(上手い人との差)が140字を超えていると登録できない' do
        @compare.zanshin = @long_sentence
        @compare.valid?
        expect(@compare.errors.full_messages).to include('残心(上手い人との差)は140文字以内で入力してください')
      end

      it '残心(改善点)空だと登録できない' do
        @compare.zanshin2 = ""
        @compare.valid?
        expect(@compare.errors.full_messages).to include('残心(改善点)を入力してください')
      end
      it '残心(改善点)が140字を超えていると登録できない' do
        @compare.zanshin2 = @long_sentence
        @compare.valid?
        expect(@compare.errors.full_messages).to include('残心(改善点)は140文字以内で入力してください')
      end
      it '気がついたことが400字を超えていると登録できない' do
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
