class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource == current_user
        @user = current_user
        if @user.flag == 2
            reset_session
        end
        root_path
    else
      top_admins_path
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
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :flag])
    end
end
