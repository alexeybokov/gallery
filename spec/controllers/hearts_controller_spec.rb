# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HeartsController, type: :controller do
  let(:user) { create(:valid_user) }
  let(:image) { create(:valid_image) }

  before :each do
    user.confirm
    sign_in user
  end

  describe 'POST #create' do
    let(:category) { create(:valid_category) }
    let(:image) { create(:valid_image) }
    let(:heart) { create(:heart) }

    before do
      post :create, params: { category_id: category.id, id: image.id }
    end

    it 'returns success(302) status code' do
      expect(response.status).to eq(302)
    end

    it 'assigns @image variables' do
      expect(assigns(:image)).to eq(image)
    end

    it 'success redirect after create hearts' do
      expect(response).to redirect_to(image_path(id: image.id))
    end

    it 'save heart' do
      expect(heart.save!).to be true
    end

    it 'create new heart' do
      expect(Heart.count).to eq(1)
    end
  end

  describe 'DELETE#destroy' do
    let(:category) { create(:valid_category) }
    let(:image) { create(:valid_image) }
    let(:heart) { create(:heart) }

    before do
      post :create, params: { category_id: category.id, id: image.id }
    end

    it 'returns success(302) status code' do
      delete :destroy, params: { category_id: category.id, id: image.id }
      expect(response.status).to eq(302)
    end

    it 'assigns @image variables' do
      expect(assigns(:image)).to eq(image)
    end

    it 'success redirect after create hearts' do
      delete :destroy, params: { category_id: category.id, id: image.id }
      expect(response).to redirect_to(image_path(id: image.id))
    end

    it 'change hearts count after destroy' do
      delete :destroy, params: { category_id: category.id, id: image.id }
      expect(Heart.count).to eq(0)
    end
  end
end
