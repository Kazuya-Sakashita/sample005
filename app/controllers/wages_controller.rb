class WagesController < ApplicationController
  before_action :set_authority_admin
  def index
    @wages = Wage.all.page(params[:page]).per(20)
    @users = User.all
  end

  def edit
    @wage = Wage.find(params[:id])
  end

  def update
    @wage = Wage.find(params[:id])
    @wage.update(wage_params)
    redirect_to wages_path
  end

  def show
    @wage = Wage.where(user_id: current_user.id)
  end

  def destroy
    @wage = Wage.find(params[:id])
    if @wage.destroy
      redirect_to wages_path
    else
      render :index
    end
  end

  def new
    @wage = Wage.new
    @wage_user = Wage.select(:user_id).pluck(:user_id)
    @user_list = User.where.not(role: 1).select(:id).pluck(:id)
    @unregistered_users_id = @user_list - @wage_user
    @unregistered_users = User.where(id: @unregistered_users_id)
  end

  def create
    @wage = Wage.new(wage_params)
    @user = User.find(@wage.user.id)
    case @user.account_state

    when 'tentative'
      @user.run!
      flash[:notice] = '単価登録しました'
      @wage.save
      redirect_to wages_path
    else
      redirect_to wages_path
    end
  end

  def wage_params
    params.require(:wage).permit(:user_id, :unit_price, :unit)
  end

  def set_authority_admin
    authorize :wage
  end
end
