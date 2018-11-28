# frozen_string_literal: true

FactoryBot.define do
  factory :follow do
    user_id { User.last.id }
    category_id { Category.last.id }
  end
end
