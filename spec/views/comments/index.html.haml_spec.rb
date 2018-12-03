# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'comments/index' do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('comments')
    expect(controller.controller_path).to eq('comments')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('index')
  end

  it 'has a request.fullpath that is defined' do
    expect(controller.request.fullpath).to eq comments_path
  end
end
