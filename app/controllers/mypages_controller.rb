class MypagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  # ログイン済ユーザーのみにアクセスを許可する

  def show
  end

  def edit
  end

  private

  def set_user
    @user = current_user
  end
end
