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
end
