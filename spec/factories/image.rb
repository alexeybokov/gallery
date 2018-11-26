# frozen_string_literal: true

require 'rails_helper'

FactoryBot.define do
  factory :image do
    name { Faker::Name.name }
    picture { File.new(Rails.root + 'spec/factories/images/image.jpg') }
    user
    category
  end
end
