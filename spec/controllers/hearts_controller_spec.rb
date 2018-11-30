# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HeartsController, type: :controller do
  before do
    @image = FactoryBot.create(:valid_image)
    @heart = FactoryBot.create(:heart)
  end

  it "returns success status code" do
    get :create
    expect(response.status).to eq(302)
  end

  it "success redirect after create hearts" do
    skip
    # expect(response).to redirect_to(image_path)
  end

  it "deletes the heart" do
    expect{
      delete :destroy, id: @image.id
    }.to change(Heart, :count).by(-1)
  end


end
