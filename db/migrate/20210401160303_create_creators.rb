# frozen_string_literal: true

class CreateCreators < ActiveRecord::Migration[6.1]
  def change
    create_table :creators do |t|
      t.belongs_to :shortened_url
      t.integer :max_touch_points
      t.string :user_agent
      t.string :language
      t.string :platform

      t.timestamps
    end
  end
end
