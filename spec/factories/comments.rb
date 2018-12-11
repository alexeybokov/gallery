# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    factory :valid_comment, parent: :comment do
      user_id { User.first.id }
      image_id { Image.first.id }
      body { Faker::Lorem.sentence(3, true, 10) }
    end

    factory :comment_without_body, parent: :comment do
      user_id { User.first.id }
      image_id { 1 }
    end

    factory :comment_without_user, parent: :comment do
      user_id { User.first.id }
      body { Faker::Lorem.sentence(3, true, 10) }
    end

    factory :comment_without_picture, parent: :comment do
      user_id { User.first.id }
      body { Faker::Lorem.sentence(3, true, 10) }
    end
  end
end
