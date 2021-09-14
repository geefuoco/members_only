class SecretsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def show
    @secret = Secret.find(params[:id])
  end

  def index
    @secret = Secret.all
  end

  def new
    @secret = current_user.secrets.build
    respond_to do |format|
      format.js
    end
  end

  def create
    @secret = current_user.secrets.build(secret_params)

    respond_to do |format|
      if @secret.save
        format.js
        flash.now[:notice] = "Secret has been created"
      else
        format.html
        flash.now[:alert] = "Error while creating Secret"
        render :index
      end
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
