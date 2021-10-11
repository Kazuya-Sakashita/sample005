class ManagementsController < ApplicationController
  before_action :authenticate_user!
  # ログイン済ユーザーのみにアクセスを許可する

  def index
    @management = Management.where(user_id: current_user.id)
  end

  def edit
    @management = Management.find(params[:id])
  end
end
