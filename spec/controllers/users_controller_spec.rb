# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UsersController, type: :controller do
  describe '#create' do
    let(:user) { create(:valid_user) }

    it 'save user with valid attributes' do
      user.save
      expect(User.count).to eq(1)
    end

    context 'with invalid attributes' do
      it 'user not save' do
        expect(build(:user_without_email).valid?).to be_falsey
      end
    end
  end
end
