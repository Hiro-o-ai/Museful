require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'アソシエーションのテスト' do
    context 'notificationモデルとの関係' do
      it '1:1となっている' do
        expect(Like.reflect_on_association(:notification).macro).to eq :has_one
      end
    end
    context 'answer、commentモデルとの関係' do
      it 'N:1となっている' do
        expect(Like.reflect_on_association(:likeable).macro).to eq :belongs_to
      end
    end
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Like.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end