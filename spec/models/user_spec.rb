require 'rails_helper'
RSpec.describe User,type: :model do
  describe 'ユーザー新規登録' do
  before do
    @user = FactoryBot.build(:user)
  end

    context '新規登録がうまくいくとき' do
      it '名前とemail、パスワードと確認用パスワード,段位が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる,パスワードとパスワード（確認用）、値が一致すれば登録できる' do
        @user.password = '000000a'
        @user.password_confirmation = '000000a'
        expect(@user).to be_valid
      end
      it 'メールアドレスは@を含むと登録できる' do
        @user.email = 'aaa@aaa'
        expect(@user).to be_valid
      end
      it '名前は20文字以内ならば登録できる' do
        @user.nickname = 'ああああああああ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it '名前が空だと登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'メールアドレスは@を含まない' do
        @user.email = 'aaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '0000a'
        @user.password_confirmation = '0000a'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it '段位が空では登録できない' do
        @user.grade_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('段位を選択してください')
      end

      
    end
  end
end
