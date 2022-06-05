# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.decimal :total, null: false, precision: 5, scale: 2
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
