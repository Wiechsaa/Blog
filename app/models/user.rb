# frozen_string_literal: true

class User < ApplicationRecord
  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notifications, as: :recipient, dependent: :destroy

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  private

  def set_default_role
    self.role ||= :user
  end
end
