class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      flash[:alert] = 'Comment was not created.'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @comment = @post.comments.find_by(id: params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_url(@post), notice: 'Comment has been updated.' }
      else
        format.html { redirect_to post_url(@post), alert: 'Comment was not updated' }
      end
    end
  end

  def destroy
    @comment = @post.comments.find_by(id: params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
