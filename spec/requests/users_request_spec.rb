require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }

  describe 'POST #create' do
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


  # describe "GET /show" do
  #   it "returns http success" do
  #     get "/users/show"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /update" do
  #   it "returns http success" do
  #     get "/users/update"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
