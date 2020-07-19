require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "バリデーションテスト" do
    before do
      @genre = build(:genre, case: "質問")
      @genre.save
      @question = create :question
    end

    context "データが正しく保存される" do
      it "全てが入力してあるので保存される" do
        expect(@question).to be_valid
      end
    end

    context "データが保存されない" do
      it "タイトルなし" do
        @question.title = ""
        expect(@question).to be_invalid
      end
      it "内容なし" do
        @question.content = ""
        expect(@question).to be_invalid
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'question_genreモデルとの関係' do
      it '1:Nとなっている' do
        expect(Question.reflect_on_association(:question_genres).macro).to eq :has_many
      end
    end

    context 'answerモデルとの関係' do
      it '1:Nとなっている' do
        expect(Question.reflect_on_association(:answers).macro).to eq :has_many
      end
    end

    context 'responseモデルとの関係' do
      it '1:Nとなっている' do
        expect(Question.reflect_on_association(:responses).macro).to eq :has_many
      end
    end

    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Question.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
