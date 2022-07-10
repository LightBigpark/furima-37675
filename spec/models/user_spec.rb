require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '同じemailは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字以上でないと登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it '数字のみのパスワードでは登録できない' do
      @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は6文字以上かつ英数字をそれぞれ含めてください")
    end
    it '英字のみのパスワードでは登録できない' do
      @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は6文字以上かつ英数字をそれぞれ含めてください")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name に全角文字を使用してください")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name に全角文字を使用してください")
    end
    it 'last_nameが全角文字でないと登録できない' do
      @user = build(:user, last_name: "ｱｲｳｴｵ")
      @user.valid?
      expect(@user.errors[:last_name]).to include("に全角文字を使用してください")
    end
    it 'first_nameが全角文字でないと登録できない' do
      @user = build(:user, first_name: "ｱｲｳｴｵ") 
      @user.valid?
      expect(@user.errors[:first_name]).to include("に全角文字を使用してください")
    end
    it 'last_kanaが空では登録できない' do
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana 全角カタカナを使用してください")
    end
    it 'first_kanaが空では登録できない' do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana 全角カタカナを使用してください")
    end
    it 'last_kanaが全角カナでないと登録できない' do
      @user = build(:user, last_kana: "あいうえお")
      @user.valid?
      expect(@user.errors[:last_kana]).to include("全角カタカナを使用してください")
    end
    it 'first_kanaが全角カナでないと登録できない' do
      @user = build(:user, first_kana: "あいうえお")
      @user.valid?
      expect(@user.errors[:first_kana]).to include("全角カタカナを使用してください")
    end
    it 'birthdayが空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
