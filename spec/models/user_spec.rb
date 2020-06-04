require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションテスト" do
    before do
      # factorybotの記述ユーザーを作成
      @user = create :user
    end
    context "データが正しく保存される" do
      it "全てが入力してあるので保存される" do
        expect(@user).to be_valid
      end
    end
    context "データが保存されない" do
      it "ニックネームなし" do
        @user.nickname = ""
        expect(@user).to be_invalid
      end
      it "同じニックネームは登録できない" do
        @user1 = build(:user, email: "sora@gmail.com")
        expect(@user1).to be_invalid
      end
      it "メールアドレスなし" do
        @user.email = ""
        expect(@user).to be_invalid
      end
      it "同じメールは登録できない" do
        @user1 = build(:user, nickname: "sorachan")
        expect(@user1).to be_invalid
      end
      it "パスワード5文字以下" do
        @user.password = "12345"
        expect(@user).to be_invalid
      end
    end
  end
end
