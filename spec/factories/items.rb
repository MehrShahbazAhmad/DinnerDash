# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    title { Faker::Name.unique.name }
    description { Faker::Lorem.sentence(1) }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    categories { build_list(:category, 3) }
    restaurants { build_list(:restaurant, 3) }
    # restaurants { build_list(:restaurant, 3) }
    # after(:build) do |item|
    #   item.images.attach(
    #     io: File.open(Rails.root.join('app', 'assets', 'images', 'defult.jpeg')),
    #     filename: 'defult.jpeg',
    #     content_type: 'image/jpeg'
    #   )
    # end
  end
end
