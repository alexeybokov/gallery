# frozen_string_literal: true

require 'rails_helper'

describe Category do
  let(:category) { FactoryBot.create :category }

  it 'is invalid without an title' do
    expect(FactoryBot.build(:category, title: nil)).not_to be_valid
  end

  it 'has many images' do
    expect(category).to respond_to :images
  end
end
