# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'images/index' do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('images')
    expect(controller.controller_path).to eq('images')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('index')
  end

  it 'has a request.fullpath that is defined' do
    expect(controller.request.fullpath).to eq images_path
  end

  context 'with 2 images' do
    skip
    # before(:each) do
    #   assign(:widgets, [
    #            Image.create!(name: 'Test', category_id: 5),
    #     Image.create!(name: 'Test2', category_id: 5)
    #          ])
    # end
    #
    # it 'displays both images' do
    #   render
    #
    #   expect(rendered).to match /Test/
    #   expect(rendered).to match /Test2/
    # end
  end
end
