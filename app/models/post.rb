class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  acts_as_paranoid
  acts_as_taggable_on :tags, :categories

  enum status: [:wip, :shipped]

  LATEST_POSTS_COUNT = 5

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
