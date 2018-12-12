# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    title { 'CategoryName' }

    association :user, factory: :valid_user

    factory :valid_category, parent: :category do
      title { Faker::Book.genre }
      user_id { User.first.id }
    end

    factory :category_with_follows, parent: :category do
      after(:create) do |category|
        create_list(:follow, 3, category: category)
      end
    end

    factory :category_without_title, parent: :category do
      user_id { User.first.id }
      title { nil }
    end

    factory :category_without_user, parent: :category do
      user { nil }
      title { Faker::Book.genre }
    end
  end
end
