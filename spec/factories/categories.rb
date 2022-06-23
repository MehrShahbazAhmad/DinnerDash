# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    title { Faker::Company.unique.name }
  end
end
