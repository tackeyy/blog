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

  def self.all_archive_list
    self.archive_list(posts: all)
  end

  def self.archive_list(posts:)
    (2016..Date.current.year).map do |year|
      this_year            = Date.new(year)
      months               = archives_of_each_months(posts: posts, this_year: this_year)
      this_year_post_count = posts.count { |post| post.created_at.between?(this_year, this_year.next_year) }
      {
        name:   "#{year}年",
        open:   false,
        months: months,
        path:   "/blog/archives/#{year}",
        total:  this_year_post_count
      }
    end.to_a.reverse
  end

  def self.archives_of_each_months(posts:, this_year:)
    this_year_posts = posts.select { |post| post.created_at.between?(this_year, this_year.next_year) }
    (1..12).map do |month|
      this_month            = Date.new(this_year.year, month)
      this_month_post_count = this_year_posts.count do |post|
        posted_month = post.created_at.to_s(:month).gsub(/^0/, '').to_i
        posted_month.between?(this_month.month, this_month.next_month.month)
      end
      next nil if this_month_post_count.zero?
      { name: "#{month}月", path: "/blog/archives/#{this_year.year}/#{month}", total: this_month_post_count }
    end.compact.to_a
  end

  private

  def post_pubsubhubbub
    return if wip?
    Nagareboshi::Sender.publish("#{Settings.url}/blog/#{friendly_id}")
  end
end
