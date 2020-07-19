require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'アソシエーションのテスト' do
    context 'answer、comment、favorite、like、responseモデルとの関係' do
      it '1:1となっている' do
        expect(Notification.reflect_on_association(:notifiable).macro).to eq :belongs_to
      end
    end
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end