class MypagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  # ログイン済ユーザーのみにアクセスを許可する

  def index
    @user = current_user
    @wage = Wage.find_by(user_id: current_user.id)
  end

  def show
    @user = current_user
    @wage = Wage.find_by(user_id: current_user.id)
    # find_byで存在しない場合、エラーでなくnilを返す
  end

  def edit
  end

  private

  def set_user
    @user = current_user
  end
end
