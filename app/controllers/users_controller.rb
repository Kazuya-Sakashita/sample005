class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_q, only: [:index, :search]

  def index
    if current_user.admin?
      @q = User.ransack(params[:q])
      @users = @q.result.includes(:skills, :skill_managements).order(:name).page(params[:page]).per(10)
      @user = current_user

    else
      redirect_to mypage_path(current_user.id)
      @user = current_user
      authorize @user
    end
  end

  def show
    # 個別のUserの情報を表示
    # @user = User.find(params[:id])
    # punditにてauthorizeメソッドにリソースオブジェクトを渡して認可状況を確認。
    authorize @user
  end

  def search
    index
    render :index
  end

  private

  def set_q
    @q = User.ransack(params[:q])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
