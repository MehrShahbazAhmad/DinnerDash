class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :title, null: false

      t.timestamps
    end
    add_index :restaurants, :title, unique: true
  end
end
