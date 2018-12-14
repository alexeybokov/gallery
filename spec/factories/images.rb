# frozen_string_literal: true

FactoryBot.define do
  factory :valid_image, class: 'Image' do
    name { Faker::Name.name }
    picture { File.new(Rails.root + 'spec/factories/images/image.jpg') }

    association :user, factory: :valid_user
    association :category, factory: :valid_category

    factory :image_without_picture do
      picture { nil }
    end

    factory :image_without_name do
      name    { nil }
    end

    factory :image_without_user do
      user { nil }
    end

    factory :image_without_category do
      category { nil }
    end

    factory :image_with_comments do
      after(:create) do |image|
        create_list(:valid_comment, 5, image: image)
      end
    end
  end
end
