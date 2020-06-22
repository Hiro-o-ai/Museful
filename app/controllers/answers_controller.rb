class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = current_user.answers.new(answer_params)
    @answer.question_id = @question.id
    @answer.save
  end

  def destroy
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.destroy
    # answer_formを展開するために使用
    @answer_new = Answer.new
  end

  def update
    if params[:answer_id] == nil
      answer = Answer.find(params[:id])
      answer.update(answer_params)
    else
      answer = Answer.find(params[:answer_id])
      answer.update(answer_params)
      if answer.status == "ベストアンサー"
        answer.question.update(status: "解決済み")
        redirect_to question_path(answer.question)
      end
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:title, :content, :status)
  end
end
