# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:user) { create(:valid_user) }

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

    it 'returns 200' do
      get :new
      expect(response).to be_ok
    end

    # it 'assigns @category variable' do
    #   expect(assigns[:category]).to eq(category)
    # end

    it 'renders new template' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #index' do
    before do
      get :index
    end

    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end

    it 'assigns instance variables' do
      expect(:category).not_to be_nil
    end

    it 'render index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    let(:user) { create(:valid_user) }
    let(:category) { create(:valid_category) }

    before do
      post :create, params: { category: { title: category.title } }
    end

    # it 'save category with valid attributes' do
    #   expect(Category.count).to eq(1)
    # end

    it 'has a 302 status code' do
      expect(response).to have_http_status(302)
    end

    it 'should be create new category' do
      expect(new_category.save!).to be_truthy
    end

    it 'should be redirect after save' do
      expect(response).to redirect_to(categories_path)
    end

    it 'should be render index after fail' do
      post :create, params: { category: { name: nil } }
      expect(response).to render_template(:index)
    end
  end
end

  # describe 'GET #show' do
  #   before do
  #     allow(Category).to receive(:find_category).and_return category
  #   end
  #
  #   it 'receives find and return post' do
  #     expect(Category).to receive(:find_category).with(category.id.to_s)
  #     get :show, id: category.id
  #   end
  #
  #   it 'assigns @category' do
  #     get :show, id: category.id
  #     expect(assigns(:category)).not_to be_nil
  #   end
  #
  #   it 'renders :show template' do
  #     get :show, id: category.id
  #     expect(response).to render_template :show
  #   end
  # end


























