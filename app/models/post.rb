class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  acts_as_taggable_on :tags, :categories
  acts_as_paranoid

  enum status: [:wip, :shipped]
end
