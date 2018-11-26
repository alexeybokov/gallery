# frozen_string_literal: true

require 'rails_helper'

FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.sentence(3, true, 10) }
    image
    user
  end
end
