# frozen_string_literal: true

require 'rails_helper'


describe User do
  let(:user) { FactoryBot.create :user }

  it 'is invalid without an email' do
    expect(FactoryBot.build(:user, email: nil)).not_to be_valid
  end

  it 'does not allow duplicate emails' do
    # expect(:subject, email: user.email).not_to be_valid
    # expect(FactoryBot.create(:user).validate_uniqueness_of(:email)
    skip
  end

  it 'has many comments' do
    expect(user).to respond_to :comments
  end

  it 'has many images' do
    expect(user).to respond_to :images
  end

  it 'has many hearts' do
    expect(user).to respond_to :hearts
  end

  it 'has many categories' do
    expect(user).to respond_to :categories
  end
end
