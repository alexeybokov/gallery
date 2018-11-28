# frozen_string_literal: true

FactoryBot.define do
  factory :heart do
    user_id { User.last.id }
    image_id { Image.last.id }
  end
end
