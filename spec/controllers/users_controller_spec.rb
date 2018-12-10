# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context '#create' do
    let(:user) { create(:valid_user) }

    it 'save user with valid attributes' do
      user.save
      expect(User.count).to eq(1)
    end
  end
end
