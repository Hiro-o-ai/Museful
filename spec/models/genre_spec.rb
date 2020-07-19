require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe "バリデーションテスト" do
    before do
      @genre = build(:genre, case: "記事")
      @genre.save
    end

    context "データが正しく保存される" do
      it "全てが入力してあるので保存される" do
        expect(@genre).to be_valid
      end
    end

    context "データが保存されない" do
      it "ジャンル名なし" do
        @genre.name = ""
        expect(@genre).to be_invalid
      end
      it "タイプなし" do
        @genre.case = ""
        expect(@genre).to be_invalid
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'article_genreモデルとの関係' do
      it '1:Nとなっている' do
        expect(Genre.reflect_on_association(:article_genres).macro).to eq :has_many
      end
    end

    context 'question_genreモデルとの関係' do
      it '1:Nとなっている' do
        expect(Genre.reflect_on_association(:question_genres).macro).to eq :has_many
      end
    end
  end
end
