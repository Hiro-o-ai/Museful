require 'rails_helper'

RSpec.describe QuestionGenre, type: :model do
  describe 'アソシエーションのテスト' do
    context 'questionモデルとの関係' do
      it 'N:1となっている' do
        expect(QuestionGenre.reflect_on_association(:question).macro).to eq :belongs_to
      end
    end
    context 'genreモデルとの関係' do
      it 'N:1となっている' do
        expect(QuestionGenre.reflect_on_association(:genre).macro).to eq :belongs_to
      end
    end
  end
end