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
  describe 'アソシエーションのテスト' do
    context 'answerモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:answers).macro).to eq :has_many
      end
    end
    context 'articleモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:articles).macro).to eq :has_many
      end
    end
    context 'bookmarkモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:bookmarks).macro).to eq :has_many
      end
    end
    context 'browsing_historieモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:browsing_histories).macro).to eq :has_many
      end
    end
    context 'commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
    context 'favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:likes).macro).to eq :has_many
      end
    end
    context 'notificationモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end
    context 'questionモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:questions).macro).to eq :has_many
      end
    end
    context 'responseモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:responses).macro).to eq :has_many
      end
    end
  end
end
