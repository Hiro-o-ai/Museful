class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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
    params.require(:user).permit(:nickname, :image, :flag)
  end
end
