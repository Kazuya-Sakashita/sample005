class UsersController < ApplicationController
  before_action :pundit_auth

  def index
  end

  def show
    @users = if current_user.admin?
      @user = current_user
      # adminは全ユーザーを表示
      User.all
    else
      # generalは、自分のを表示
      redirect_to user_path(current_user.id)
      @user = current_user
      authorize @user
    end
  end

  private
  def pundit_auth
    authorize User.new
  end

end
