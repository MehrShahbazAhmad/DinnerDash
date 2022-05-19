class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.decimal :price, null: false, precision: 5, scale: 2
      t.integer :status, null: false,  default: 0

      t.timestamps
    end
    add_index :items, :title, unique: true
  end
end
