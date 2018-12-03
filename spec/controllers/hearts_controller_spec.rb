# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HeartsController, type: :controller do
  let(:user) { create(:valid_user) }
  let(:image) { create(:valid_image) }

  before :each do
    user.confirm
    sign_in user
  end
  # before do
  #   @image = FactoryBot.create(:valid_image)
  #   @heart = FactoryBot.create(:heart)
  # end

  describe 'POST #create' do
    let(:category) { create(:valid_category) }
    let(:image) { build(:valid_image) }
    let(:heart) { build(:heart) }

    it "returns success(200) status code" do
      expect(response.status).to eq(200)
    end

    it "success redirect after create hearts" do
      skip
      # expect(response).to redirect_to(image_path)
    end

    it 'save heart' do
      skip
      # expect(heart.save!).to be true
    end

    it "deletes the heart" do
      skip
      # expect{
      #   delete :destroy, id: @image.id
      # }.to change(Heart, :count).by(-1)
    end

  end
end
