class ManagementsController < ApplicationController
  before_action :authenticate_user!
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :set_management, only: %w[edit update]

  def index
    @management = Management.where(user_id: current_user.id)
  end

  def new
    @management = Management.new
  end

  def create
    @management = Management.new(management_params)
    @management.user_id = current_user.id
    if @management.save
      flash[:notice] = '投稿しました！'
      redirect_to managements_path
    else
      flash.now[:alert] = '入力内容が正しくありません'
      render :index
    end
  end

  def edit
  end

  def update
    @management.update(management_params)
    redirect_to managements_path
  end

  private

  def management_params
    params.require(:management).permit(:uptime, :unit, :date, :date)
  end

  def set_management
    @management = Management.find(params[:id])
  end
end
