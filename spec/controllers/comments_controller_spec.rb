# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { build(:valid_user) }
  let(:image) { build(:valid_image).save }
  let(:comment) { build(:valid_comment).save }

  before do
    user.confirm
    sign_in user
  end

  describe 'GET #index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'assigns instance variables' do
      expect(:image).not_to be_nil
    end

    it 'assigns instance variables' do
      expect(:comment).not_to be_nil
    end
  end

  describe 'POST #create' do
    before { post :create, params: { image_id: image.id } }

    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end

    it 'renders :create template' do
      expect(response).to redirect_to(image_comments_path)
    end
  end
end
