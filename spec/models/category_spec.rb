# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category do
  before do
    FactoryBot.build(:valid_user)
  end

  let(:category) { FactoryBot.build(:valid_category) }

  describe 'association tests' do
    it 'should belongs_to user' do
      expect(Category.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'has many images' do
      expect(category).to respond_to :images
    end
  end

  describe 'validation tests' do
    it 'is invalid without an title' do
      expect(FactoryBot.build(:category_without_title).save).to be_falsey
    end

    it 'ensures user_present' do
      expect(FactoryBot.build(:category_without_user).save).to be_falsey
    end
  end
end
