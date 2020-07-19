require 'rails_helper'

RSpec.describe ArticleGenre, type: :model do
  describe 'アソシエーションのテスト' do
    context 'articleモデルとの関係' do
      it 'N:1となっている' do
        expect(ArticleGenre.reflect_on_association(:article).macro).to eq :belongs_to
      end
    end
    context 'genreモデルとの関係' do
      it 'N:1となっている' do
        expect(ArticleGenre.reflect_on_association(:genre).macro).to eq :belongs_to
      end
    end
  end
end