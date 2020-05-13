# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "Michael (#{n})" }
    sequence(:last_name) { |n| "Jordan (#{n})" }
    sequence(:email) { |n| "user-#{n}@example.com" }
  end
end
