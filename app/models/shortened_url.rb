class ShortenedUrl < ApplicationRecord
  validates :short, :url, presence: true
  validates :short, uniqueness: true
  has_many :clicks
  has_many :creators
end
