require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "バリデーションテスト" do
    before do
      @genre = build(:genre, case: "記事")
      @genre.save
      @article = create :article
    end
    context "データが正しく保存される" do
      it "全てが入力してあるので保存される" do
        expect(@article).to be_valid
      end
    end
    context "データが保存されない" do
      it "タイトルなし" do
        @article.title = ""
        expect(@article).to be_invalid
      end
      it "内容なし" do
        @article.content = ""
        expect(@article).to be_invalid
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'article_genreモデルとの関係' do
      it '1:Nとなっている' do
        expect(Article.reflect_on_association(:article_genres).macro).to eq :has_many
      end
    end
    context 'bookmarkモデルとの関係' do
      it '1:Nとなっている' do
        expect(Article.reflect_on_association(:bookmarks).macro).to eq :has_many
      end
    end
    context 'browsing_historieモデルとの関係' do
      it '1:Nとなっている' do
        expect(Article.reflect_on_association(:browsing_histories).macro).to eq :has_many
      end
    end
    context 'commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Article.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
    context 'favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Article.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Article.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end