# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'images/show', type: :view do
  let(:user) { create(:valid_user) }
  let(:image) { create(:image_with_comments) }

  before do
    user.confirm
    login_as user, scope: :user
    assign(:image, image)
    assign(:comments, image.comments)
    visit image_path(category_id: image.category.id, id: image.id)
  end

  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('images')
    expect(controller.controller_path).to eq('images')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('show')
  end

  it 'should  be render _button.html.haml' do
    expect(page).to render_template('hearts/_button')
  end

  it 'should  be render _comment.html.haml' do
    expect(page).to render_template('comments/_comment')
  end

  it 'have heart button' do
    expect(page).to have_button('Heart')
  end

  it 'have heart button' do
    expect(page).to have_button('Add Comment')
  end

  it 'have image on page' do
    expect(page).to have_selector('img')
  end

  it 'have comment' do
    expect(page).to have_content(image.comments[1].body)
  end

  it 'have author of comment' do
    expect(page).to have_content(user.email)
  end
end
