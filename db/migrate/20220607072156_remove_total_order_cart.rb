# frozen_string_literal: true

class RemoveTotalOrderCart < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :total, :decimal, precision: 5, scale: 2, null: false
    remove_column :cart_items, :sub_total, :decimal, precision: 5, scale: 2, null: false

    remove_column :orders, :total, :decimal, precision: 5, scale: 2, null: false
    remove_column :order_items, :sub_total, :decimal, precision: 5, scale: 2, null: false
  end
end
