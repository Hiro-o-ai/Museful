require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe "バリデーションテスト" do
    before do
      @genre = build(:genre, case: "質問")
      @genre.save
      @answer = create :answer
    end

    context "データが正しく保存される" do
      it "全てが入力してあるので保存される" do
        expect(@answer).to be_valid
      end
    end

    context "データが保存されない" do
      it "内容なし" do
        @answer.content = ""
        expect(@answer).to be_invalid
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'notificationモデルとの関係' do
      it '1:1となっている' do
        expect(Answer.reflect_on_association(:notification).macro).to eq :has_one
      end
    end

    context 'likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Answer.reflect_on_association(:likes).macro).to eq :has_many
      end
    end

    context 'questionモデルとの関係' do
      it 'N:1となっている' do
        expect(Answer.reflect_on_association(:question).macro).to eq :belongs_to
      end
    end

    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Answer.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
