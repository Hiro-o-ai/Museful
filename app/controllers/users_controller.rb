class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # 閲覧履歴一覧用
    @browsing_histories = @user.browsing_histories
    # ブックマーク一覧用
    @bookmarks = @user.bookmarks
    @articles = @user.articles.order(created_at: :desc)
    @questions = @user.questions.order(created_at: :desc)
    @clear_quesions = @questions.where(status:"解決済み")
    @answers = @user.answers
    @best_answers = @answers.where(status:"ベストアンサー")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def leave
    @user = User.find(params[:user_id])
  end

  def leave_update
    @user = User.find(params[:user_id])
    @user.update(user_params)
    reset_session
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :image, :status, :introduction)
  end
end
