# frozen_string_literal: true

class Creator < ApplicationRecord
  belongs_to :shortened_url
end
