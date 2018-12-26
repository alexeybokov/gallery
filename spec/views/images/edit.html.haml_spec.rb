# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'images/edit', type: :view do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('images')
    expect(controller.controller_path).to eq('images')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('edit')
  end
end
