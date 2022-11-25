# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :user

  has_noticed_notifications model_name: 'Notification'
  has_rich_text :body

  after_create_commit :notify_recipient
  before_destroy :cleanup_nofifications

  private

  def notify_recipient
    return if post.user == user

    CommentNotification.with(comment: self, post: post).deliver_later(post.user)
  end

  def cleanup_nofifications
    notifications_as_comment.destroy_all
  end
end
