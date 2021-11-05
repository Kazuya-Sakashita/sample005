class UsersController < ApplicationController
  before_action :pundit_auth

  def index
    @users = if current_user.admin?
               @user = current_user
               # adminは全ユーザーを表示
               User.all
             else
               # generalは、自分のを表示
               redirect_to mypages_path(current_user.id)
               @user = current_user
               authorize @user
             end
  end

  def show
    # 個別のUserの情報を表示
    @user = User.find(params[:id])
    # punditにてauthorizeメソッドにリソースオブジェクトを渡して認可状況を確認。
    authorize @user
  end

  private

  def pundit_auth
    authorize User.new
  end
end
