# frozen_string_literal: true

require 'rails_helper'


describe User do
  let(:user) { FactoryBot.create :user }

  it 'is invalid without an email' do
    # expect(:subject, email: nil).not_to be_valid
    skip
  end

  it 'does not allow duplicate emails' do
    # expect(:subject, email: user.email).not_to be_valid
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




# RSpec.describe User, type: :model do
#   before(:all) do
#     @user1 = create
#   end
#
#   it "is valid with valid attributes" do
#     expect(@user1).to be_valid
#   end
# end
