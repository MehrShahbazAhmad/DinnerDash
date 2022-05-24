# frozen_string_literal: true

class CreateRestaurantItems < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_items do |t|
      t.references :item, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
