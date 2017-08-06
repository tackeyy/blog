class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  acts_as_paranoid
  acts_as_taggable_on :tags, :categories

  LATEST_POSTS_COUNT = 5

  enum status: %i[wip shipped]

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

  after_create :post_pubsubhubbub

  def initialize(attributes = {})
    super
    self.status = :wip if status.blank?
  end

  private

  def post_pubsubhubbub
    return if wip?
    Nagareboshi::Sender.publish("#{Settings.url}/blog/#{friendly_id}")
  end
end
