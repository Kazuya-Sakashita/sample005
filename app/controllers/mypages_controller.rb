class MypagesController < ApplicationController

  def index
    @user = User.where(id: current_user.id)
  end
  
  def edit
    @user = User.find(params[:id])
  end
end
