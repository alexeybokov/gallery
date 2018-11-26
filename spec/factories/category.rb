# frozen_string_literal: true

require 'rails_helper'

FactoryBot.define do
  factory :category do
    title { Faker::Book.title }
    user
  end
end
