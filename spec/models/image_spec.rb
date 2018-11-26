# frozen_string_literal: true

require 'rails_helper'

describe Image do
  let(:image) { FactoryBot.create :image }

  it 'should belongs_to user' do
    expect(Image.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'should belongs_to category' do
    expect(Image.reflect_on_association(:category).macro).to eq(:belongs_to)
  end

  it 'has many comments' do
    expect(image).to respond_to :comments
  end

  it 'has many hearts' do
    expect(image).to respond_to :hearts
  end

  it 'is invalid without an name' do
    expect(FactoryBot.build(:image, name: nil)).not_to be_valid
  end

  it 'is invalid without an picture' do
    expect(FactoryBot.build(:image, picture: nil)).not_to be_valid
  end
end
