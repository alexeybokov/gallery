# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'categories/show', type: :view do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('categories')
    expect(controller.controller_path).to eq('categories')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('show')
  end
end
