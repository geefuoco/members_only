class SecretsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def show
    @secret = Secret.find(params[:id])
  end

  def index
    @secret = Secret.all
  end

  def new
    @secret = Secret.new
  end

  def create
    @secret = Secret.new(secret_params)

    if @secret.save
      redirect_to root_path, notice: "Secret has been posted."
    else
      render :new, alert: "Error while creating Secret"
    end
  end

  def edit
    @secret = Secret.find(params[:id])
  end

  def update
    @secret = Secret.find(params[:id])
  end

  def destroy
    @secret = Secret.find(params[:id])
    @secret.destroy
    redirect_to root_path, notice: "Secret successfully removed."
  end

  private

  def secret_params
    params.require(:secret).permit(:title, :body)
  end
end
