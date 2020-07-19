require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let(:user_params) { attributes_for(:user) }
  let(:article_params) { attributes_for(:article) }

  before do
    @user =  create :user
    @genre = build(:genre, case: "記事")
    @genre.save
    @article = create(:article, user: @user)
    post user_session_path, params: { user: user_params }
  end

  describe '記事を新規投稿' do
    context 'パラメータが妥当な場合' do
      it "記事投稿画面に遷移すること" do
        get new_article_path
        expect(response.status).to eq 200
      end
      it 'リクエストが成功すること' do
        post articles_path, params: { article: article_params }
        expect(response.status).to eq 200
      end
    end
  end

  describe "記事を変更する" do
    context "パラメータが妥当な場合" do
      it "記事編集画面に遷移すること" do
        get edit_article_path(@article)
        expect(response.status).to eq 200
      end
      it "リクエストに成功すること" do
        put article_path(@article), params: { article: article_params }
        expect(response.status).to eq 302
      end
    end
  end
end
