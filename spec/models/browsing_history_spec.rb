require 'rails_helper'

RSpec.describe BrowsingHistory, type: :model do
  describe 'アソシエーションのテスト' do
    context 'articleモデルとの関係' do
      it 'N:1となっている' do
        expect(BrowsingHistory.reflect_on_association(:article).macro).to eq :belongs_to
      end
    end

    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(BrowsingHistory.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
