class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:notice] = '投稿しました！'
      redirect_to clients_path
    else
      flash.now[:alert] = '入力内容が正しくありません'
      render :index
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def show
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    redirect_to clients_path
  end

  def destroy
  end

  private

  def client_params
    params.require(:client).permit(:company_name, :staff, :email, :phone)
  end
end
