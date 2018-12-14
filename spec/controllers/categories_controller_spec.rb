# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:valid_user) }
  let(:category) { create(:valid_category) }

  before :each do
    user.confirm
    sign_in user
  end

  describe 'GET #new' do
    let(:category) { double(Category) }

    before do
      allow(Category).to receive(:new).and_return(category)
      get :new
    end

    it 'returns success responce' do
      get :new
      expect(response).to be_successful
    end

    it 'assigns @category variable' do
      expect(assigns[:category]).to eq(category)
    end

    it 'renders new template' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #index' do
    subject! { get :index }

    it 'returns success responce' do
      expect(response).to be_successful
    end

    it 'assigns instance variables' do
      expect(:category).not_to be_nil
    end

    it 'render index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    let(:category) { build(:valid_category) }

    it 'save category with valid attributes' do
      expect(category.save!).to be true
    end

    it 'has a 302 status code' do
      expect(response).to have_http_status(200)
    end

    it 'should be redirect after save' do
      post :create, params: { category: { title: category.title } }
      expect(response).to redirect_to(categories_path)
    end

    context 'with invalid attributes' do
      it 'should be render new template after fail' do
        post :create, params: { category: { name: nil } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    subject! { get :show, params: { id: category.id } }

    it 'has a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'receives find and return category' do
      expect(controller).to receive(:find_category)
      get :show, params: { id: category.id }
      expect(assigns(:category)).not_to be_nil
    end

    it 'assigns @category' do
      expect(assigns(:category)).to be_truthy
    end

    it 'renders :show template' do
      expect(response).to render_template :show
    end
  end

  describe 'DELETE #destroy' do
    subject! { delete :destroy, params: { id: category.id } }

    it 'has a 302 status code' do
      expect(response).to have_http_status(302)
    end

    it 'should redirect to categories page after remove category' do
      expect(response).to redirect_to(categories_path)
    end

    it 'assigns a success flash message' do
      expect(flash[:alert]).not_to be_nil
    end
  end

  describe 'PUT #follow' do
    subject! { put :follow, params: { id: category.id } }

    it 'has a 302 status code' do
      expect(response).to have_http_status(302)
    end

    it 'should redirect to category path after create follow' do
      expect(response).to redirect_to(category_path)
    end
  end

  describe 'PUT #unfollow' do
    subject! { put :unfollow, params: { id: category.id } }

    it 'has a 302 status code' do
      expect(response).to have_http_status(302)
    end

    it 'should redirect to category path after destroy follow' do
      expect(response).to redirect_to(category_path)
    end
  end
end
