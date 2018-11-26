# frozen_string_literal: true

require 'rails_helper'

FactoryBot.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    name { Faker::Name.name }
    email { FactoryBot.generate(:email) }
    password { 'developer' }
  end
end
