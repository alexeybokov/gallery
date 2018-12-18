# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Heart, type: :model do
  before do
    build(:valid_user)
    create(:valid_image)
  end

  let(:heart) { build :heart }

  it 'is an instance of Heart' do
    expect(subject).to be_an Heart
  end

  describe 'association tests' do
    it 'should belongs_to user' do
      expect(Heart.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'should belongs_to image' do
      expect(Heart.reflect_on_association(:image).macro).to eq(:belongs_to)
    end
  end

  describe 'validation test' do
    it 'is invalid without an user_id' do
      expect(FactoryBot.build(:heart, user_id: nil)).not_to be_valid
    end
  end
end
