# frozen_string_literal: true

require 'rails_helper'

describe ImagesController do
  # The model will be used in the specs for all methods of the controller
  let(:image) { double(Image) }
  let(:user) { create(:valid_user) }

  describe 'POST create' do
    before :each do
      sign_in user
    end

    before { allow(Image).to receive(:new).and_return(image) }

    describe 'GET new' do
      it 'returns 200' do
        get :new
        expect(response).to be_ok
      end
    end

    it 'creates a new image with the given attributes' do
      expect(Image).to receive(:new).with(name: 'The New Image Name').and_return(image)
      post :create, message: { name: 'The New Image Name' }
    end

    it 'saves the image' do
      expect(image).to receive(:save)
      post :create
    end

    it 'redirects to the Images index' do
      allow(image).to receive(:save)
      post :create
      expect(response).to redirect_to(action: 'index')
    end
  end
end
# describe 'ImagesController' do
#   let(:image_params) { FactoryBot.attributes_for(:image).stringify_keys }
#   let(:category) { FactoryBot.build_stubbed(:category) }
#   let(:user) { FactoryBot.create(:user) }
#
#   describe 'GET #show' do
#     before do
#       allow(Image).to receive(:set_image).and_return image
#     end
#
#     it 'receives find and return post' do
#       expect(Image).to receive(:find).with(image.id.to_s)
#       get :show, id: image.id
#     end
#
#     it 'assigns @image' do
#       get :show, id: image.id
#       expect(assigns(:image)).not_to be_nil
#     end
#
#     it 'renders :show template' do
#       get :show, id: image.id
#       expect(response).to render_template :show
#     end
#   end
# end
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
