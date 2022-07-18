# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    user { FactoryBot.build(:user) }
    items { build_list(:item, 4) }
  end
end
