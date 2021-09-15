class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable

  def new
    @comment = @commentable.comments.build
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    if @comment.save
      flash.now[:notice] = "Successfully posted comment"
    else
      flash.now[:alert] = "Error while posting comment"
    end
    redirect_to @commentable
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

    def find_commentable
      if params[:secret_id]
        @commentable = Secret.find_by_id(params[:secret_id])
      elsif params[:comment_id]
        @commentable = Comment.find_by_id(params[:comment_id])
      end
    end
  
end