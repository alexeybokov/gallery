# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    factory :valid_image, parent: :image do
      name { Faker::Name.name }
      picture { File.new(Rails.root + 'spec/factories/images/image.jpg') }
      user_id { User.first.id }
      category_id { Category.first.id }
    end

    factory :image_without_picture, parent: :image do
      name { Faker::Name.name }
      user_id { User.first.id }
      category_id { Category.first.id }
    end

    factory :image_without_name, parent: :image do
      user_id { User.first.id }
      category_id { Category.first.id }
      picture { File.new(Rails.root + 'spec/factories/images/image.jpg') }
    end

    factory :image_without_user, parent: :image do
      name { Faker::Name.name }
      category_id { Category.first.id }
      picture { File.new(Rails.root + 'spec/factories/images/image.jpg') }
    end

    factory :image_without_category, parent: :image do
      user_id { User.first.id }
      name { Faker::Name.name }
      picture { File.new(Rails.root + 'spec/factories/images/image.jpg') }
    end
  end
end
