# frozen_string_literal: true

FactoryBot.define do
  factory :user do

    factory :valid_user, parent: :user do
      name { Faker::Name.name }
      email { Faker::Internet.email }
      password { Faker::Internet.password }

      after(:create) do |_user, evaluator|
        evaluator.confirm
      end
    end

    factory :user_without_email, parent: :user do
      name { Faker::Name.name }
      password { Faker::Internet.password }
    end
  end
end
