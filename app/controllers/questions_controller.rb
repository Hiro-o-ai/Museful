class QuestionsController < ApplicationController
  impressionist :actions=>[:show]
  before_action :authenticate_user!, only:[:new, :edit]
  before_action :correct_user, only: [:edit]
  def new
    @question = Question.new
    @genres = Genre.where(case: "質問",status: "有効")
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to question_path(@question)
    else
      @genres = Genre.where(case: "質問",status: "有効")
      render :new
    end
  end

  def index
    @questions = Question.includes(:question_genres).order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def edit
    @genres = Genre.where(case: "質問",status: "有効")
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      @genres = Genre.where(case: "質問",status: "有効")
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :content, genre_ids: [])
  end

  def correct_user
    @question = Question.find(params[:id])
    if  @question.user_id != current_user.id
      redirect_to questions_path
    end
  end
end
