# frozen_string_literal: true

class AddOrderCountToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :order_count, :integer, default: 0
  end
end
