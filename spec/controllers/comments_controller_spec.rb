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
    subject! { get :index }

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
    let(:user) { create(:valid_user) }
    let(:image) { create(:valid_image) }
    let(:comment) { build(:valid_comment, image: image) }
    let(:invalid_comment) { build(:comment_without_user) }

    before do
      user.confirm
      sign_in user
      get :index
    end

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

    context 'with invalid attributes' do
      it 'should be render index after fail' do
        invalid_comment.save
        expect(response).to render_template('comments/index')
      end

      it 'is invalid without body' do
        expect(build(:comment_without_body).valid?).to be_falsey
      end

      it 'is invalid without user' do
        expect(build(:comment_without_user).valid?).to be_falsey
      end

      it 'is invalid without picture' do
        expect(build(:comment_without_picture).valid?).to be_falsey
      end
    end
  end
end
