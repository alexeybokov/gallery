# frozen_string_literal: true

require 'spec_helper'

RSpec.describe User, type: :model do
  let(:user) { create :valid_user }

  it 'is an instance of User' do
    expect(subject).to be_an User
  end

  it 'is invalid without an email' do
    expect(build(:user, email: nil)).not_to be_valid
  end

  it 'does not allow duplicate emails' do
    user
    new_user = User.new(email: user.email, password: Faker::Internet.password)
    new_user.valid?
    expect(new_user.errors.any?).to be true
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

  it 'has many activities' do
    expect(user).to respond_to :activities
  end

  context 'change email' do
    xit 'sends email changed notification' do
      user.email = Faker::Internet.email
      expect(UserMailer).to receive(:email_changed).with(user).and_return(double('emeil', deliver: true))
      user.save
    end

    it "doesn't send email changed notification" do
      user.name = 'Santa Claus'
      expect(UserMailer).not_to receive(:follow_email)
      user.save
    end
  end
end
