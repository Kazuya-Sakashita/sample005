class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  def after_sign_in_path_for(_resource)
    users_path
  end

  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [
                                        :name,
                                        :phone_number,
                                        :skills,
                                        :skill_level,
                                        :github_url,
                                        :account_info,
                                        :unit_price,
                                        :unit
                                      ])
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = '権限がありません'
    redirect_to(root_path)
  end
end
