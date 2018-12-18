# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'categories/new', type: :view do
  let(:user) { create(:valid_user) }

  before do
    user.confirm
    login_as user, scope: :user
    visit categories_path
  end

  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('categories')
    expect(controller.controller_path).to eq('categories')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('new')
  end

  context 'modal window' do
    before do
      find('#categoryModal').click
    end

    it 'should be render kaminari' do
      expect(rendered).to render_template(partial: 'kaminari/_paginator')
    end

    it 'should be rendered' do
      expect(rendered).to render_template(partial: 'categories/_modal_new')
    end

    it 'should be contain categories/form' do
      expect(rendered).to render_template(partial: '_modal_new')
    end

    it 'should be have text <Add category>' do
      expect(page).to have_content('Create a new Category')
    end

    it 'should be have field <Title>' do
      expect(page).to have_field('category_title')
    end

    it 'should be have button <Create Category>' do
      expect(page).to have_button('Create Category')
    end

    it 'should be have button <Close>' do
      expect(page).to have_button('Close')
    end
  end
end
