# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:valid_user) }
  let(:image) { create(:valid_image) }
  let(:comment) { create(:valid_comment) }

  before do
    user.confirm
    sign_in user
  end

  describe 'GET #index' do
    before do
      get :index
    end

    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end

    it 'render index template' do
      expect(response).to render_template(:index)
    end

    it 'assigns instance variables @image' do
      expect(:comment).to be_truthy
    end
  end

  describe 'POST #create' do
    let(:image) { create(:valid_image) }
    let(:comment) { build(:valid_comment, image: image) }

    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end

    it 'renders :create template' do
      post :create, params: {
          image_id: image.id,
          comment: {
                    user_id: User.first.id,
                    body: Faker::Lorem.sentence(3, true, 10)
          }
      }
      expect(response).to redirect_to image_path(id: image.slug)
    end

    it 'save comment with valid attributes' do
      expect(comment.save!).to be true
    end
  end

  context 'with 2 or more comments' do
    skip
    # let(:user) { create(:valid_user) }
    # let(:image) { create(:valid_image) }
    # let(:comment) { build(:valid_comment, image: image) }
    #
    # it 'orders them in reverse chronologically' do
    #   image = Image.create!(picture: fixture_file_upload(Rails.root + 'spec/factories/images/image.jpg'),
    #            name: Faker::Name.name,
    #            category_id: '5')
    #   comment1 = image.comments.create!(body: 'first comment', user_id: user.id)
    #   comment2 = image.comments.create!(body: 'second comment', user_id: user.id)
    #   # expect(image.reload.comments).to eq([comment2, comment1])
    #   expect(assigns(:comments)). to eq image.comments.order(created_at: :desc)
    # end
  end
end
