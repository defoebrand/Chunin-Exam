# frozen_string_literal: true

class CreateShortenedUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :shortened_urls do |t|
      t.string :short
      t.string :url
      t.integer :click_count, default: 0

      t.timestamps
    end
    add_index :shortened_urls, :short, unique: true
  end
end
