class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end


  private

    def comment_params
      params.require(:comment).permit(:body)
    end
  
end