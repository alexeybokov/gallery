# frozen_string_literal: true

require 'rails_helper'

FactoryBot.define do
  factory :follow do
    user
    category
  end
end
