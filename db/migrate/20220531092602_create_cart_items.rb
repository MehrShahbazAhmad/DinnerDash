# frozen_string_literal: true

class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :item, foreign_key: true
      t.references :cart, foreign_key: true
      t.integer :quantity, default: 1, null: false
      t.decimal :sub_total, null: false, precision: 5, scale: 2
      t.timestamps
    end
  end
end
