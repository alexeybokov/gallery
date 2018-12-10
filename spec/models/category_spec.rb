# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    create(:valid_user)
  end

  let(:category) { build(:valid_category) }

  it 'is an instance of Category' do
    expect(subject).to be_an Category
  end

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
      expect(build(:category_without_title).valid?).to be_falsey
      # expect(build(:category_without_title).valid?).to be_falsey
    end

    it 'ensures user_present' do
      expect(build(:category_without_user).valid?).to be_falsey
    end
  end
end
