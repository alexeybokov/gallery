# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'images/new', type: :view do
  let(:user) { create(:valid_user) }

  before do
    user.confirm
    login_as user, scope: :user
    visit images_path
  end

  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('images')
    expect(controller.controller_path).to eq('images')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('new')
  end

  context 'modal window' do
    before do
      find('#imageModal').click
    end

    it 'should be rendered' do
      expect(rendered).to render_template(partial: 'images/_modal')
    end

    it 'should be contain categories/form' do
      expect(rendered).to render_template(partial: '_modal_new')
    end

    it 'should be have text "Create a new Image"' do
      expect(page).to have_content('Create a new Image')
    end

    it 'should be have field "Name"' do
      expect(page).to have_field('image_name')
    end

    it 'should be have button "Create Image"' do
      expect(page).to have_button('Create Image')
    end

    it 'should be have button "Close"' do
      expect(page).to have_button('Close')
    end
  end
end
