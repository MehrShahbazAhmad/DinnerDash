# frozen_string_literal: true

FactoryBot.define do
  factory :restaurant do
    title { Faker::Company.unique.name }
  end
end
