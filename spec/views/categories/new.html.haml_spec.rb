# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categories/new' do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('categories')
    expect(controller.controller_path).to eq('categories')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('new')
  end
end
