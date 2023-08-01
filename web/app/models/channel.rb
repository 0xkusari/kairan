class Channel < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true, length: { in: 1..8000 }
  validates :category, presence: true

  enum :category, { general:0, blog: 1, diary: 2, podcast: 3, vlog: 4, news: 5 }
end