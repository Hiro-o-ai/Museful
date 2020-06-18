class QuestionsController < ApplicationController
  impressionist :actions=>[:create, :show]
  def new
    @question = Question.new
    @genres = Genre.where(case: "質問")
    impressionist(@question)
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to question_path(@question)
    else
      @genres = Genre.where(case: "質問")
      render :new
    end
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    impressionist(@question)
  end

  def edit
    @question = Question.find(params[:id])
    @genres = Genre.where(case: "質問")
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      @genres = Genre.where(case: "質問")
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
end
