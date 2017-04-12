class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  acts_as_taggable_on :tags, :categories
  acts_as_paranoid

  enum status: [:wip, :shipped]

  RECENT_POSTS_CONT = 5
  LATEST_POSTS_COUNT = 3

  validates :status,
            presence: true
  validates :slug,
            presence: true
  validates :category_list,
            presence: true
  validates :tag_list,
            presence: true
  validates :title,
            presence: true
  validates :body,
            presence: true

  def initialize(attributes = {})
    super
    self.status = :wip if status.blank?
  end
end
