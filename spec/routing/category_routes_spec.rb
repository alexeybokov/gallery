# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'routes to the categories controller', type: :routing do
  it 'routes /categories/:new to categories#new' do
    expect(get: new_category_path).to route_to(controller: 'categories', action: 'new')
  end

  it 'routes /categories/:create to categories#create' do
    expect(post: categories_path).to route_to(controller: 'categories', action: 'create')
  end

  it 'routes /categories/:nature to categories#show for nature' do
    expect(get: '/categories/nature').to route_to(
      controller: 'categories',
      action: 'show',
      id: 'nature'
    )
  end

  it 'routes /categories to categories#index ' do
    expect(get: '/categories').to route_to(
      controller: 'categories',
      action: 'index'
    )
  end

  it 'expose a delete' do
    expect(delete: '/categories/1').to be_routable
  end

  it 'expose a update' do
    expect(put: '/categories/1').to be_routable
  end
end
