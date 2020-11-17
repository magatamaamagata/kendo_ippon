require 'rails_helper'
RSpec.describe Judge,type: :model do
  describe 'クイズ回答' do
  before do
    @judge = FactoryBot.build(:judge)
  end

    context 'クイズ回答がうまくいくとき' do
      it '全て入力されていれば登録できる' do
        expect(@judge).to be_valid
      end
    end

    context 'クイズ回答がうまくいかないとき' do
      it '回答を選択していないと登録できない' do
        @judge.judge_correct_id = 1
        @judge.valid?
        expect(@judge.errors.full_messages).to include('正誤回答を選択してください')
      end
    end
  end
end
