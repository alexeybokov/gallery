# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'comments/index', type: :view do

  let(:user) { create(:valid_user) }
  let(:image) { create(:image_with_comments) } # Comment count = 5

  before do
    user.confirm
    login_as user, scope: :user
    assign(:image, image)
    assign(:comments, image.comments)
    visit image_path(category_id: image.category.id, id: image.id)
  end

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

  it 'renders _comment partial for each comment' do
    expect(page).to render_template('comments/_comment')
    expect(image.comments_count).to eq 5
  end

  it 'have comments' do
    expect(page).to have_content(image.comments[1].body)
  end

  it 'have author of comment' do
    expect(page).to have_content(user.email)
  end
end
