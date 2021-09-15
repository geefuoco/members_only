class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable

  def new
    @comment = @commentable.comments.build
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { render js: "location.reload();", notice: "Successfully posted comment" }
      else
        format.js { render js: "location.reload();", alert: "Error while posting comment"}
      end
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @comment = @commentable.comments.find_by_id(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { render js: "location.reload();", notice: "Sucessfully removed post"}
    end
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