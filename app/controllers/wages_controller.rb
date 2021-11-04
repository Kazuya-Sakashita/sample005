class WagesController < ApplicationController

  def index
      if @user = current_user.admin?
        # adminは全ユーザーを表示
        @wages = Wage.all
        @users = User.all
      else
        # generalは、自分のを表示
        redirect_to wage_path(current_user.id)
        @user = current_user
        authorize @user
      end
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
    end
  
    def destroy
      @wage = Wage.find(params[:id])
      @user = current_user
      authorize @user
  
      if @wage.destroy
        redirect_to wages_path
      else
        render :index
      end
    end
  
    def new
      @wage = Wage.new
      @wage_user = Wage.select(:user_id).pluck(:user_id)
      @user_list = User.where.not(role:1).select(:id).pluck(:id)
      @unregistered_users_id = @user_list - @wage_user
      @unregistered_users = User.where(id: @unregistered_users_id)
    end
  
    def create
      @wage = Wage.new(wage_params)
      @wage.save
      redirect_to wages_path
      @user = current_user
      authorize @user
    end
  
    def wage_params
      params.require(:wage).permit(:user_id, :unit_price, :unit)
    end
end
