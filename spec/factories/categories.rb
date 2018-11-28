# frozen_string_literal: true

FactoryBot.define do
  factory :category do

    factory :valid_category, parent: :category do
      title { Faker::Book.genre }
      user_id { User.first.id }
    end

    factory :category_without_title, parent: :category do
      user_id { User.first.id }
    end

    factory :category_without_user, parent: :category do
      title { Faker::Book.genre }
    end
  end
end
