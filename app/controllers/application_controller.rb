# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_notifications, if: :current_user
  before_action :set_query
  before_action :set_categories

  private

  def set_notifications
    notifications = Notification.includes(:recipient).where(recipient: current_user).newest_first.limit(9)
    @unread = notifications.unread
    @read = notifications.read
  end

  def set_query
    @query = Post.ransack(params[:q])
  end

  def set_categories
    @nav_categories = Category.where(visible: true).order(:name)
  end

  def is_admin!
    redirect_to root_path, alert: "You are not allowed to do that." unless current_user.admin?
  end
end
