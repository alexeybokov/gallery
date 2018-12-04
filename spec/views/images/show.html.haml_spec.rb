# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'images/show' do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('images')
    expect(controller.controller_path).to eq('images')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('show')
  end

  it 'should  be render _button.html.haml' do
    skip
    # expect(rendered).to render(partial: 'hearts/button')
  end

  it 'should  be render _comment.html.haml' do
    skip
    # expect(rendered).to render(partial: 'comments/comment')
  end
end
