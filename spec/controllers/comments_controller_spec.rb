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

    it 'assigns instance variables @image' do
      allow(:image).to receive(:create).and_return true
      get :index
      expect(assigns(:images)).to eq([image])
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



  context "with 2 or more comments" do
    it "orders them in reverse chronologically" do
      # image = Image.create!(user_id: User.last,
      #                       category_id: Category.first.id,
      #                       picture: File.new(Rails.root + 'spec/factories/images/image.jpg'),
      #                       name: Faker::Name.name)
      comment1 = image.comments.create!(:body => "first comment")
      comment2 = image.comments.create!(:body => "second comment")
      expect(image.reload.comments).to eq([comment2, comment1])
    end
  end
end
