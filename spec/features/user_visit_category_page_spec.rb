# frozen_string_literal: true

require 'rails_helper'

feature 'Category pages' do

  given!(:user) { create(:valid_user) }
  given!(:category) { create(:valid_category) }
  given!(:image) { create(:valid_image, category: category) }

  before do
    user.confirm
    login_as user, scope: :user
    visit category_path(id: category.id)
  end

  scenario 'User can see Category info' do
    expect(page).to have_content("#{category.title}")
  end

  scenario 'User can see image of category' do
    expect(page).to have_content("#{image.name}")
  end

  scenario 'User can add new category' do
    # click_link('add Category')
    visit new_category_path
    expect(page).to have_button('Create Category')
  end

  scenario 'User see flash Success if add new category' do
    visit new_category_path
    fill_in 'category[title]', with: category.title
    click_button('Create Category')
    expect(page).to have_content('Category created')
  end

  scenario 'User can Follow to Category' do
    expect(page).to have_button('Follow')
  end

  scenario 'User can delete own Category' do
    expect(page).to have_button('Delete Category')
  end

  scenario 'Delete Category' do
    skip
    # click_button('Delete Category')
    # accept_alert do
    #   click_link('Ok')
    # end
    # expect(page).to have_content('Category and images removed')
  end
end
