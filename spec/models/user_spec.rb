# frozen_string_literal: true

require 'spec_helper'

describe User do
  let(:user) { FactoryBot.create user }

  it 'is invalid without an email' do
    expect(FactoryBot.build :user, email: nil).not_to be_valid
  end

  it 'does not allow duplicate emails' do
    expect(FactoryBot.build :user, email: user.email).not_to be_valid
  end

  # it 'is invalid without a name'
  #   expect(FactoryBot.build :user, name: nil).not_to be_valid
  # end

  # it 'has many posts' do
  #   expect(user).to respond_to :comments
  # end

  context 'change email' do
    it 'sends email changed notification' do
      user.email = Faker::Internet.email
      expect(UserMailer).to receive(:email_changed).with(user).and_return(double('email', deliver: true))
      user.save
    end

    it "doesn't send email changed notification" do
      user.name = 'Santa Claus'
      expect(UserMailer).not_to receive(:email_changed)
      user.save
    end
  end

  it { expect(user).to have_many(:comments) }
  it { expect(user).to have_many(:images) }
  it { expect(user).to have_many(:hearts) }
  it { expect(user).to have_many(:categories) }
end
