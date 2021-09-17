class CommentsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :find_commentable

  def show
  end

  def new
    @comment = @commentable.comments.build
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        @secret = Secret.find_by_id(params[:secret_id]) ||
          find_top_post(Comment.find(params[:comment_id])) 
        flash.now[:notice] = "Comment posted"
        format.js { @secret } 
      else
        flash.now[:alert] = "Error posting comment"
        format.js { render json: @comment.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      # redirect_to session.delete(:return)
      redirect_to @comment
    else
      render :edit, notice: "An error occured while editting your comment."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash[:notice] = "Sucessfully removed post"
      format.js { render js: "location.reload();"}
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

    def find_top_post(comment)
      if comment.commentable_type == "Secret"
        return Secret.find_by_id!(comment.commentable_id)
      end
      find_top_post(Comment.find_by_id!(comment.commentable_id))
    end
  
end