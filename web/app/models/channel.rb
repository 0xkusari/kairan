class Channel < ApplicationRecord
  has_many :items

  validates :title, presence: true
  validates :url, presence: true, uniqueness: true, length: { in: 1..8000 }
  validates :category, presence: true

  enum :category, { general:0, blog: 1, diary: 2, podcast: 3, vlog: 4, news: 5 }

  before_validation :set_title

  def set_title
    doc = Nokogiri::XML.parse(HTTP.get(url).to_s)
    self.title = doc.xpath("//channel/title").text
  end
end
