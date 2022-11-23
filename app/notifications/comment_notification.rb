# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  def message
    @post = Post.find_by(id: params[:comment][:post_id])
    @comment = Comment.find_by(id: params[:comment][:id])
    @user = User.find_by(id: @comment.user_id)
    "#{@user.email} commented on #{@post.title.truncate(10)}"
  end

  def url
    post_path(Post.find_by(id: params[:comment][:post_id]))
  end
end
