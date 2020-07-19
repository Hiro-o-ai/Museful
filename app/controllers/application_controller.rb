class ApplicationController < ActionController::Base
  # protect_from_forgeryを無効にするために使用(csrf対策の一部を無効化している)
  # ない場合はadminログアウト後にuserログアウトをするとInvalidAuthenticityTokenが発生
  skip_before_action :verify_authenticity_token, raise: false, except: :delete

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource == current_user
      @user = current_user
      if @user.status == "退会済"
        reset_session
      end
      root_path
    else
      admins_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :user
      root_path
    elsif resource == :admin
      admins_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :status])
  end
end
