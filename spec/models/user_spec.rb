require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    it "同じemailが存在すると登録ができない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
       #user = FactoryBot.create(:user, email: "test.user@email")
      #another_user = FactoryBot.build(:user, email: "test.user@email")
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは、@を含んでいないと登録できない" do
      @user.email = "test.testgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードがないと登録できない" do
      @user.password = ""
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは、6文字以上での入力じゃないと入力" do
      @user.password = "aaaa1"
      @user.password_confirmation = "aaaa1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは、半角英数字混合での入力でないと入力できない" do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には半角の英字数字の両方を含めて設定してください")
    end
    it "パスワードは、確認用を含めて2回入力しないと登録できない" do
      @user.password
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

      "Password confirmation doesn't match Password"
    end
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password
      @user.password_confirmation = "bbb222"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe "新規登録/本人情報確認" do
    it "ユーザー本名は、名字が空だと登録できない" do
      @user.last_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
    end  
    it "ユーザー本名は、名前が空だと登録できない" do
      @user.first_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end
    it "ユーザー本名の名前は、全角（漢字・ひらがな・カタカナ）での入力でないと登録できない" do
      @user.first_name_kanji = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji 全角文字を使用してください")
    end
    it "ユーザー本名の苗字は、全角（漢字・ひらがな・カタカナ）での入力でないと登録できない" do
      @user.last_name_kanji = "ﾀﾅｶ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji 全角文字を使用してください")
    end
    it "ユーザー本名のフリガナは、苗字が空だと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "ユーザー本名のフリガナは、名前が空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "ユーザー本名のフリガナは、苗字が空だと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "ユーザー本名の名前はフリガナは、全角（カタカナ）での入力でないと登録できない" do
      @user.first_name_kana = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角(カタカナ)を使用してください")
    end
    it "ユーザー本名の名前はフリガナは、全角（カタカナ）での入力でないと登録できない" do
      @user.last_name_kana = "ﾀﾅｶ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角(カタカナ)を使用してください")
    end    
    it "生年月日が空だと登録できない" do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end  
  end
end
