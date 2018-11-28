# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context '#create' do
    @count = User.count
    let(:user) { create(:valid_user) }
      it 'creates a new user' do
        expect(User.count).eq @count + 1
      end
  end
end
