# frozen_string_literal: true

class AddColumnToShortenedUrl < ActiveRecord::Migration[6.1]
  def change
    add_column :shortened_urls, :click_count, :integer, default: 0
  end
end
