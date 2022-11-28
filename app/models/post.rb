# frozen_string_literal: true

class Post < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: %i[slugged history finders]

  validates :title, presence: true
  validates :body, presence: true

  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user, dependent: :destroy

  has_rich_text :body
  has_one :content, class_name: 'ActionText::RichText', as: :record

  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end
end
