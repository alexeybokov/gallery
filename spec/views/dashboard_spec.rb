# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'dashboard/index.html.haml', type: :view do
  let(:user) { create(:valid_user) }
  let(:category) { create(:valid_category) }
  let(:image) { create(:image_with_comments) }

  before do
    user.confirm
    login_as user, scope: :user
    assign(:image, image)
    visit root_path
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('index')
  end

  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('dashboard')
    expect(controller.controller_path).to eq('dashboard')
  end
end
