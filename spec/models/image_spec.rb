# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image, type: :model do
  before do
    FactoryBot.build(:valid_user)
    FactoryBot.build(:category)
  end

  let(:image) { FactoryBot.build(:valid_image) }

  describe 'association tests' do
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
  end

  describe 'validation tests' do
    it 'ensures name present' do
      expect(FactoryBot.build(:image_without_name).save).to be_falsey
    end

    it 'ensures picture present' do
      expect(FactoryBot.build(:image_without_picture).save).to be_falsey
    end

    it 'ensures user present' do
      expect(FactoryBot.build(:image_without_user).save).to be_falsey
    end

    it 'ensures category present' do
      expect(FactoryBot.build(:image_without_category).save).to be_falsey
    end
  end
end
