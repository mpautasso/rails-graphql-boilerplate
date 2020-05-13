# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user
    sequence(:title) { |n| "Eloquent Ruby (#{n})" }
    sequence(:body) { |n| "Write specs (#{n})" }
  end
end
