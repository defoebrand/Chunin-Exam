# frozen_string_literal: true

class ShortenedUrl < ApplicationRecord
  validates :short, :url, presence: true
  validates :short, uniqueness: true
  has_many :clicks
end
