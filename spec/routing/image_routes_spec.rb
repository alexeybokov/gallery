# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes to the images controller', type: :routing do
  it 'routes a named route' do
    expect(get: new_image_path).to route_to(controller: 'images', action: 'new')
  end

  it 'routes /images/:create to images#create' do
    expect(post: images_path).to route_to(controller: 'images', action: 'create')
  end

  it 'routes /images/:book to images#show for book' do
    expect(get: '/images/book').to route_to(
      controller: 'images',
      action: 'show',
      id: 'book'
    )
  end

  it 'routes /images to images#index' do
    expect(get: '/images').to route_to(
      controller: 'images',
      action: 'index'
    )
  end

  it 'does not expose a delete' do
    expect(delete: '/images/1').not_to be_routable
  end

  it 'does not expose a update' do
    expect(put: '/images/1').not_to be_routable
  end
end
