# frozen_string_literal: true

class CreateCategoryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :category_items do |t|
      t.references :item, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :category_items, %i[item_id category_id], unique: true
  end
end
