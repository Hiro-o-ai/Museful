require 'rails_helper'

RSpec.describe "Questions", type: :request do
  let(:user_params) { attributes_for(:user) }
  let(:question_params) { attributes_for(:question) }

  before do
    @user =  create :user
    @genre = build(:genre, case: "質問")
    @genre.save
    @question = create(:question, user: @user)
    post user_session_path, params: { user: user_params }
  end
  describe '質問を新規投稿' do
    context 'パラメータが妥当な場合' do
      it "質問投稿画面に遷移すること" do
        get new_question_path
        expect(response.status).to eq 200
      end
      it 'リクエストが成功すること' do
        post questions_path, params: { question: question_params }
        expect(response.status).to eq 200
      end
    end
  end
  describe "質問を変更する" do
    context "パラメータが妥当な場合" do
      it "質問編集画面に遷移すること" do
        get edit_question_path(@question)
        expect(response.status).to eq 200
      end
      it "リクエストに成功すること" do
        put question_path(@question), params: { question: question_params }
        expect(response.status).to eq 302
      end
    end
  end
end