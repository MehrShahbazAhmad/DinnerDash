# frozen_string_literal: true

FactoryBot.define do
  factory :cart do
    association :user
    # user { FactoryBot.build(:user) }
    # items { build_list(:item, 4) }
  end
end
