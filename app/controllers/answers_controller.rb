class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = current_user.answers.new(answer_params)
    @answer.question_id = @question.id
    if @answer.save
    else
      render '/questions/show'
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy
    # answer_formを展開するために使用
    @answer_new = Answer.new
  end

  private
  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
