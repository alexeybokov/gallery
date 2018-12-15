# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    factory :valid_activity, parent: :activity do
      action  { 'navigate' }
      url     { 'www.gallery.com' }
    end
    association :user, factory: :valid_user
  end
end
