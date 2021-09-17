class ApplicationController < ActionController::Base

  protected
  
  def in_the_future
    @secret = Secret.find(params[:id])
    @secret.destroy
  end

end
