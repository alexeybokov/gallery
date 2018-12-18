# frozen_string_literal: true

require 'spec_helper'

feature 'Admin login', driver: :selenium_chrome do

  given!(:admin) { create(:admin_user) }
  given!(:user) { create(:valid_user) }
  given!(:category) { create(:valid_category) }
  given!(:image) { create(:valid_image, category: category) }

  before do
    user.confirm
    login_as user, scope: :user
    visit admin_user_session_path
    fill_in 'admin_user[email]', with: admin.email
    fill_in 'admin_user[password]', with: admin.password
    click_button('Login')
  end

  scenario 'Navigate to Categories' do
    expect(page).to have_content('All Categories')
  end

  feature 'Manage' do

    before do
      find_link(text: 'All Categories').click
    end

    scenario 'See manage links' do
      expect(page).to have_content("#{category.title}")
      expect(page).to have_link('View')
      expect(page).to have_link('Edit')
      expect(page).to have_link('Delete')
    end

    feature 'View' do
      before do
        find_link(text: 'View').click
      end

      scenario 'see info' do
        expect(page).to have_content("#{category.title}")
        expect(page).to have_content('NAME')
        expect(page).to have_content('CREATED AT')
        expect(page).to have_content('UPDATED AT')
        expect(page).to have_content('RANGE COUNTER')
      end
    end

    feature 'Create' do
      before do
        find_link(text: 'New All Category').click
      end

      scenario 'new category' do
        expect(Category.count).to eq(1)
        fill_in 'category[title]', with: 'New title'
        find('#category_user_id').find(:xpath, 'option[2]').select_option
        find('#category_submit_action').click
        expect(Category.count).to eq(2)
      end
    end

    feature 'Edit' do
      before do
        find_link(text: 'Edit').click
      end

      scenario 'change category title' do
        fill_in 'category[title]', with: 'Change title'
        find('#category_submit_action').click
        expect(page).to have_content('Category was successfully updated.')
        expect(page).to have_content('Change title')
      end

      scenario 'change category creator' do
        find('#category_user_id').find(:xpath, 'option[2]').select_option
        find('#category_submit_action').click
        expect(page).to have_content('Category was successfully updated.')
      end
    end

    feature 'Delete' do
      scenario 'remove category' do
        expect(Category.count).to eq(1)
        find_link(text: 'Delete').click
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content('Category was successfully destroyed.')
        visit admin_user_session_path
        expect(Category.count).to eq(0)
      end
    end
  end
end
