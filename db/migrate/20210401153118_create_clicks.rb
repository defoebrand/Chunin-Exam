# frozen_string_literal: true

class CreateClicks < ActiveRecord::Migration[6.1]
  def change
    create_table :clicks do |t|
      t.belongs_to :shortened_url
      t.string :user_agent
      t.string :language

      t.timestamps
    end
  end
end
