class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def editi
  end

  def update
  end
end
