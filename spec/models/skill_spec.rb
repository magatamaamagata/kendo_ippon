require 'rails_helper'
RSpec.describe Skill,type: :model do
  describe '動画投稿' do
  before do
    @skill = FactoryBot.build(:skill)
  end

    context '動画投稿がうまくいくとき' do
      it '動画と技名が存在すれば登録できる' do
        expect(@skill).to be_valid
      end
    end

    context '動画投稿がうまくいかないとき' do
      it '動画が空だと登録できない' do
        @skill.video = nil
        @skill.valid?
        expect(@skill.errors.full_messages).to include("動画を選択してください")
      end
      
      it '技名が空では登録できない' do
        @skill.youtube_id = 1
        @skill.valid?
        expect(@skill.errors.full_messages).to include('技名を選択してください')
      end
    end
  end
end
