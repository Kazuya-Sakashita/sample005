class MypagesController < ApplicationController
  before_action :authenticate_user!
  # ログイン済ユーザーのみにアクセスを許可する

  def show
    @user = User.where(id: current_user.id)
  end

  def edit
    @user = current_user
  end
end
