require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "バリデーションテスト" do
    before do
      @genre = build(:genre, case: "質問")
      @genre.save
      @comment = create :comment
    end

    context "データが正しく保存される" do
      it "全てが入力してあるので保存される" do
        expect(@comment).to be_valid
      end
    end

    context "データが保存されない" do
      it "内容なし" do
        @comment.content = ""
        expect(@comment).to be_invalid
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'notificationモデルとの関係' do
      it '1:1となっている' do
        expect(Comment.reflect_on_association(:notification).macro).to eq :has_one
      end
    end

    context 'likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Comment.reflect_on_association(:likes).macro).to eq :has_many
      end
    end

    context 'articleモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:article).macro).to eq :belongs_to
      end
    end

    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
