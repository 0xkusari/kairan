class Channel < ApplicationRecord
  has_many :items

  validates :title, presence: true
  validates :url, presence: true, uniqueness: true, length: { in: 1..8000 }
  validates :category, presence: true

  enum :category, { general:0, blog: 1, diary: 2, podcast: 3, vlog: 4, news: 5 }

  before_validation :set_title_and_icon_url

  def set_title_and_icon_url
    feed = Feedjira.parse(HTTP.get(url).to_s)
    self.title = feed.title
    self.icon_url = feed&.image&.url.presence if feed.respond_to?(:image)
  end

  def fetch_items
    feed = Feedjira.parse(HTTP.get(url).to_s)
    feed.entries.sort_by(&:published).each do |entry|
      self.items.create(title: entry.title, url: entry.url)
    end
  end
end
