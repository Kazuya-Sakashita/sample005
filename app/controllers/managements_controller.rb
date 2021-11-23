class ManagementsController < ApplicationController
  before_action :authenticate_user! # ログイン済ユーザーのみにアクセスを許可する
  before_action :set_management, only: [:edit, :update]
  before_action :set_q, only: [:index, :search]

  def index
    if current_user.admin?
      @q = Management.ransack(params[:q])
      # @user_managements = @q.result.page(params[:page]).per(10)
      @user_managements = @q.result.includes(:user, :wage).page(params[:page]).per(10)
      @user = current_user
      # @wage = Wage.find_by(id: current_user.id)
      @wages = Wage.all
    else
      redirect_to management_path(current_user.id)
      @user = current_user
      authorize @user
    end
  end

  def new
    @end_of_months = (Date.today..Date.today.advance(months: 12)).select { |date| date == date.end_of_month }
  end

  def create
    @management = Management.new(management_params)
    params[:date] = params[:date].to_datetime # データ変換しなければ保存できない
    # @management.user_id = current_user.id
    @management.save
    flash[:notice] = '投稿しました！'
    redirect_to managements_path
  end

  def show
    @user_management = Management.where(user_id: current_user.id)
  end

  def edit
  end

  def state
    @user = User.find(params[:id])
    case @user.account_state

    when 'sleeping'
      @user.run!
      flash[:notice] = 'ステータスをactiveに変更しました！'
      redirect_to managements_path
    when 'active'
      @user.sleep!
      flash[:notice] = 'ステータスをsuspendedに変更しました！'
      redirect_to managements_path
    else
      render :index
    end
  end

  def update
    @management.update(up_management_params)
    redirect_to managements_path
  end

  def search
    index
    render :index
  end

  private

  def set_q
    @q = Management.ransack(params[:q])
  end

  def management_params
    params.permit(:user_id, :project, :uptime, :unit, :date)
  end

  def up_management_params
    params.require(:management).permit(:user_id, :project, :uptime, :unit, :date)
  end

  def set_management
    @management = Management.find(params[:id])
    @user = @management.user_id
    return unless current_user.id != @user # 稼働管理user_idとログイン者を比較

    redirect_to managements_path # 一覧ページにリダイレクトさせる
  end

  def set_user_column
    @management_user = Management.select('user_id').distinct # 重複なくUser_idカラムのデータを取り出す
  end
end
