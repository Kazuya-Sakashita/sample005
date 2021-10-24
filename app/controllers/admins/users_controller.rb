class Admins::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def editi
  end

  def update
  end
end
