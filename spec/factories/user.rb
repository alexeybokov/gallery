require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) { FactoryBot.create :user }

  it 'is invalid without an email' do
    expect(FactoryBot.build :user, email: nil).not_to be_valid
  end

  it 'does not allow duplicate emails' do
    expect(FactoryBot.build :user, email: user.email).not_to be_valid
  end

  it 'is invalid without a name' do
    expect(FactoryBot.build :user, name: nil).not_to be_valid
  end

  it 'has many orders' do
    expect(user).to respond_to :orders
  end

  it 'has many ratings' do
    expect(user).to respond_to :ratings
  end
end
