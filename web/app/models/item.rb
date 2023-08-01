class Item < ApplicationRecord
  belongs_to :channel

  validates :channel_id, presence: true
  validates :title, presence: true
  validates :url, presence: true, length: { in: 1..8000 }, uniqueness: { scope: :channel_id }
end
