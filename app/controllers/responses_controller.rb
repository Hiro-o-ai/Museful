class ResponsesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    response = current_user.responses.new(question_id: @question.id)
    response.save
  end

  def destroy
    @question = Question.find(params[:question_id])
    response = current_user.responses.find_by(question_id: @question.id)
    response.destroy
  end
end
