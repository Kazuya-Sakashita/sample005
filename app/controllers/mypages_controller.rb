class MypagesController < ApplicationController
  before_action :authenticate_user!
  # ログイン済ユーザーのみにアクセスを許可する

  def index
    @user = User.where(id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end
end
