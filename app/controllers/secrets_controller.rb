class SecretsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def show
    @secret = Secret.find(params[:id])
    session[:return] = request.referer
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
        flash.now[:notice] = "Secret has been posted"
        format.js { @secret = Secret.all }
      else
        flash.now[:alert] = "Please ensure title and body length is 5 characters minimum"
        format.json { render json: @secret.errors.full_messages, status: :unprocessable_entity}
        format.js
      end
    end

  end

  def edit
    @secret = current_user.secrets.find(params[:id])
  end

  def update
    @secret = current_user.secrets.find(params[:id])
    if @secret.update(secret_params)
      redirect_to root_path, notice: "Your secret has been updated"
    else
      render :edit, notice: "Invalid secret update"
    end
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
