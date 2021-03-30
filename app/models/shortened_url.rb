# frozen_string_literal: true

class ShortenedUrl < ApplicationRecord
  self.primary_key = 'short'
  validates :short, :url, presence: true
  validates :short, uniqueness: true
end
