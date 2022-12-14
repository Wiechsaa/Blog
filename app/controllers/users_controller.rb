# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user

  def profile
    @posts = @user.posts.includes(:rich_text_body).order(created_at: :desc)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
