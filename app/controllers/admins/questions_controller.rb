class Admins::QuestionsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admins_questions_path
  end
end
