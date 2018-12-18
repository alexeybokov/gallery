# frozen_string_literal: true

require 'spec_helper'

describe UserMailer do
  let(:user) { create(:valid_user) }
  let(:category) { create(:category_with_follows) }
  let(:mail) do
    UserMailer.with(user: category.follows.first.user,
                    category: category.slug).new_image_email
  end

  describe 'new_image_email' do
    let(:mail) { UserMailer.with(user: user).new_image_email }

    it 'rendered the new_image subject' do
      expect(mail.subject).to eq('New Image')
    end

    xit 'render the receiver email' do
      expect(mail.to).to eq([category.follows.first.user.email])
    end

    it 'render the sender email' do
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'should be send welcome email' do
      mail.deliver
      expect(ActionMailer::Base.deliveries.count).to eq(2)
    end
  end

  describe 'follow_email' do
    let(:category) { create(:valid_category) }
    let(:mail) { UserMailer.with(user: user, category: category.slug).follow_email }

    it 'render the follow subject' do
      expect(mail.subject).to eq('Follow')
    end

    it 'render the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'render the sender email' do
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'should be send follow email' do
      mail.deliver
      expect(ActionMailer::Base.deliveries.count).to eq(3)
    end
  end
end
