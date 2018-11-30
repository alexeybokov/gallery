# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:user) { create(:valid_user) }

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
    before do
      get :index
    end

    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end

    it 'assigns instance variables' do
      expect(:image).not_to be_nil
    end

    it 'render index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    let(:image) { build(:valid_image) }

    before { allow(Image).to receive(:new).and_return(image) }

    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end

    context 'when save image' do
      before do
        post :create, params: { category_id: Category.first.id,
                                image: { picture: File.new(Rails.root + 'spec/factories/images/image.jpg'),
                                         name: Faker::Name.name } }
      end

      it 'save image with valid attributes' do
        expect(Image.count).to eq(1)
      end

      it 'after save redirects to images url' do
        expect(response).to redirect_to(image_path(image))
      end

      it 'assings a success flash message' do
        expect(flash[:notice]).not_to be_nil
      end

      it 'saves the image' do
        expect(image.save!).to be_truthy
      end
    end

    context 'with invalid attributes' do
      it 'success redirect to new template' do
        post :create, params: { image: { name: Faker::Name.name } }
        expect(response).to redirect_to(new_image_path)
      end


      it 'renders the new template' do
        image.stub(:).and_return(false)
        post :create
        response.should render_template("new")
      end
    end
  end

  describe 'GET #show' do
    before do
      allow(Image).to receive(:set_image).and_return image
      get :show, id: image.id
    end

    it 'receives find and return images' do
      expect(Image).to receive(:find).with(image.id)
    end

    it 'assigns @image' do
      expect(assigns(:image)).not_to be_nil
    end

    it 'renders :show template' do
      get :show
      expect(response).to render_template :show
    end
  end
end


























# describe 'ImagesController' do
#   let(:image_params) { FactoryBot.attributes_for(:image).stringify_keys }
#   let(:category) { FactoryBot.build_stubbed(:category) }
#   let(:user) { FactoryBot.create(:user) }
#
# describe 'DELETE categories#destroy' do
#   let(:image) { FactoryBot.create :category }
#   let(:user) { FactoryBot.create :user }
#
#   it 'should delete image' do
#     login_as(:user)
#     visit image_path(image.id)
#     page.should have_link("Delete")
#     expect { click_link "Delete" }.to change(Image, :count).by(-1)
#   end
# end
