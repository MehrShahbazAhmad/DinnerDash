# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "#{Faker::Name.unique.first_name}@example.com" }
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.last_name }
    user_name { Faker::Name.unique.initials(number: 4) }
    password { '123456' }
  end
end
