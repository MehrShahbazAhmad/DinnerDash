class CreateRestaurantItems < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_items do |t|
      t.belongs_to :item
      t.belongs_to :restaurant

      t.timestamps
    end
  end
end
