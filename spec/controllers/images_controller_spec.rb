# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:user) { create(:valid_user) }
  let(:image) { create(:valid_image) }

  before :each do
    user.confirm
    sign_in user
  end

  describe 'GET #new' do
    let(:image) { double(Image) }

    before do
      allow(Image).to receive(:new).and_return(image)
      get :new
    end

    it 'returns 200' do
      get :new
      expect(response).to be_ok
    end

    it 'assigns @image variable' do
      expect(assigns[:image]).to eq(image)
    end

    it 'renders new template' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #index' do
    subject! { get :index }

    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end

    it 'assigns instance variables' do
      expect(:image).to be_truthy
    end

    it 'render index template' do
      expect(response).to render_template(:index)
    end

    context 'activity' do
      it 'action is "navigate"' do
        expect(Activity.last.action).to eq('navigation')
      end

      it 'url is "http://test.host/images"' do
        expect(Activity.last.url).to eq('http://test.host/images')
      end

      it 'record to db' do
        expect(Activity.count).to eq(1)
      end
    end
  end

  describe 'POST #create' do
    let(:category) { create(:valid_category) }
    let(:image) { build(:valid_image) }

    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end

    it ' after save image redirect to image path' do
      post :create,
           params: {
             image: {
               picture: fixture_file_upload(Rails.root + 'spec/factories/images/image.jpg'),
               name: Faker::Name.name,
               category_id: category.id
             }
      }
      expect(response).to redirect_to(image_path(id: category.images.first.slug))
    end

    it 'save image with valid attributes' do
      expect(image.save!).to be true
    end

    it 'assings a success flash message' do
      post :create, params: {
             image: {
               picture: fixture_file_upload(Rails.root + 'spec/factories/images/image.jpg'),
               name: Faker::Name.name,
               category_id: category.id
             }
      }
      expect(flash[:notice]).not_to be_nil
    end

    context 'with invalid attributes' do
      it 'redirect to new template if image not save(without picture)' do
        post :create, params: { image: attributes_for(:image_without_picture) }
        expect(response).to render_template(:new)
      end

      it 'show flash alert if image not save(without picture)' do
        post :create, params: { image: attributes_for(:image_without_picture) }
        expect(flash[:alert]).not_to be_nil
      end

      it 'redirect to new template if image not save(without name)' do
        post :create, params: { image: attributes_for(:image_without_name) }
        expect(response).to render_template(:new)
      end

      it 'show flash alert if image not save(without name)' do
        post :create, params: { image: attributes_for(:image_without_name) }
        expect(flash[:alert]).not_to be_nil
      end

      it 'redirect to new template if image not save(without category)' do
        post :create, params: { image: attributes_for(:image_without_category) }
        expect(response).to render_template(:new)
      end

      it 'show flash alert if image not save(without category)' do
        post :create, params: { image: attributes_for(:image_without_category) }
        expect(flash[:alert]).not_to be_nil
      end
    end
  end

  describe 'GET #show' do

    subject! { get :show, params: { id: image.id } }

    it 'has a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'receives find and return images' do
      allow(controller).to receive(:set_image).and_return image
      get :show, params: { id: image.id }
      expect(assigns(:image)).not_to be_nil
    end

    it 'assigns @image' do
      expect(assigns(:image)).to be_truthy
    end

    it 'renders :show template' do
      expect(response).to render_template :show
    end

    context 'activity' do
      it 'action is "navigation"' do
        expect(Activity.last.action).to eq('navigation')
      end

      it 'url is "http://test.host/images"' do
        expect(Activity.last.url).to match('http://test.host/images')
      end

      it 'record to db' do
        expect(Activity.count).to eq(1)
      end
    end
  end

  describe 'DELETE #destroy' do

    subject! { delete :destroy, params: { id: image.id } }

    xit 'has a 302 status code' do
      expect(response).to have_http_status(302)
    end

    xit 'should redirect to categories page after remove category' do
      expect(response).to redirect_to(images_path)
    end

    xit 'assigns a success flash message' do
      expect(flash[:alert]).not_to be_nil
    end

    context 'activity' do
      xit 'action is "delete category"' do
        expect(Activity.last.action).to eq('delete category')
      end

      xit 'url is "http://test.host/categories"' do
        expect(Activity.last.url).to match('http://test.host/categories')
      end

      xit 'record to db' do
        expect(Activity.count).to eq(1)
      end
    end
  end
end
