# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  describe 'GET #index' do
    let(:user) { build(:valid_user) }

    before do
      user.confirm
    end

    it 'returns http success after User Sign In' do
      sign_in user
      get :index
      expect(response.status).to eq(200)
    end
  end

  context 'when the user is logged out' do
    it 'should redirect to the login page' do
      skip
      # get :index
      # expect(response).to redirect_to(user_session_path)
    end
  end
end
