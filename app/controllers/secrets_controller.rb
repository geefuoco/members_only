class SecretsController < ApplicationController
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
  end

  private

  def secret_params
    params.require(:secret).permit(:title, :body)
  end
end
