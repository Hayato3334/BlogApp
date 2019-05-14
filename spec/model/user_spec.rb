require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  context '有効なユーザーである時' do
    it '有効なユーザーの検証' do
      expect(@user).to be_valid
    end
    it "メールアドレスの小文字変換" do
      @user.email = "TEST@EXAMPle.com"
      @user.save!
      expect(@user.email).to eq "test@example.com"
    end
  end

  context '無効なユーザーである時' do
    it '名前の存在' do
      @user.name = ""
      expect(@user).not_to be_valid
    end
    it "ユーザー名の長さ" do
      @user.name = "a" * 11
      expect(@user).not_to be_valid
    end
    it "メールアドレスの存在" do
      @user.email = ""
      expect(@user).not_to be_valid
    end
    it "メールアドレスの一意性" do
      user = build(:user, email: 'test@example.com')
      expect(user).not_to be_valid
    end
    it "パスワードの存在" do
      @user.password = @password_confirmation = ""
      expect(@user).not_to be_valid
    end
    it "パスワードの長さ" do
      @user.password = @password_confirmation = "a" * 5
      expect(@user).not_to be_valid
    end
  end
end
