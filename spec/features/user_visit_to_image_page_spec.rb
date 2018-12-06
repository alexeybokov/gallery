# frozen_string_literal: true

require 'rails_helper'

feature 'Image pages' do

  given!(:user) { create(:valid_user) }
  given!(:category) { create(:valid_category) }
  given!(:image) { create(:valid_image) }
  given!(:comment) { create(:valid_comment) }

  before do
    user.confirm
    login_as user, scope: :user
    visit image_path(id: image.id)
  end

  scenario 'User can see image info' do
    expect(page).to have_content("#{image.name}")
  end

  scenario 'User can see image_comment' do
    expect(page).to have_content("#{comment.body}")
  end

  scenario 'User can add Heart' do
    expect(page).to have_button('Heart')
  end

  scenario 'Change heart_counter after click Heart' do
    click_button('Heart')
    expect(page).to have_content('1')
  end

  scenario 'User can write comment' do
    expect(page).to have_button('Add Comment')
  end

  scenario 'Show user comment on page after create' do
    fill_in 'comment[body]', with: comment.body
    click_button('Add Comment')
    expect(page).to have_content("#{comment.body}")
  end
end
