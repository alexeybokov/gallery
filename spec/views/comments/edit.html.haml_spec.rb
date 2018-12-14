# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'comments/edit', type: :view do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('comments')
    expect(controller.controller_path).to eq('comments')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('edit')
  end
end
