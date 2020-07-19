require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }

  describe '新規登録' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 302
      end
      it 'createが成功すること' do
        expect do
          post user_registration_path, params: { user: user_params }
        end.to change(User, :count).by 1
      end
      it 'リダイレクトされること' do
        post user_registration_path, params: { user: user_params }
        expect(response).to redirect_to root_path
      end
    end
  end
  describe 'ログイン' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post user_session_path, params: { user: user_params }
        expect(response.status).to eq 200
      end
    end
  end
  describe 'ユーザー情報更新' do
    context '正常なパラメータの場合' do
      it 'リクエストが成功すること' do
        put user_path user, params: { user: user_params }
        expect(response.status).to eq 302
        expect(response).to redirect_to User.last
      end
    end
  end
end
