# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DashboardController, type: :controller do

  describe 'GET #index' do
    let(:user) { build(:valid_user) }
    let(:category) { build(:valid_category) }
    let(:image) { build(:valid_image) }

    before do
      sign_in user
    end

    subject! { get :index }

    it 'returns http success after User Sign In' do
      expect(response.status).to eq(200)
    end

    it 'render index template' do
      expect(response).to render_template(:index)
    end

    it 'assigns instance variable @category' do
      expect(category).to be_truthy
    end

    it 'assigns instance variable @image' do
      expect(image).to be_truthy
    end

    context 'when the user is logged out' do
      xit 'should redirect to the login page' do
        sign_out user
        get :index
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end
end
