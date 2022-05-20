class CreateRestaurantItems < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_items do |t|

      t.timestamps
    end
  end
end
