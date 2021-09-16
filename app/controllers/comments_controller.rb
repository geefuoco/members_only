class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable

  def new
    @comment = @commentable.comments.build
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render js: "location.reload();", notice: "Successfully posted comment" }
      else
        format.js { render js: "location.reload();", notice: "Error while posting comment"}
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to session.delete(:return)
    else
      render :edit, notice: "An error occured while editting your comment."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js { render js: "location.reload();", notice: "Sucessfully removed post"}
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