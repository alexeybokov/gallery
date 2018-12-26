# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'categories/index', type: :view do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('categories')
    expect(controller.controller_path).to eq('categories')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('index')
  end

  it 'has a request.fullpath that is defined' do
    expect(controller.request.fullpath).to eq categories_path
  end

  # it 'have follow button' do
  #   expect(page).to have_button('Follow')
  # end
end
