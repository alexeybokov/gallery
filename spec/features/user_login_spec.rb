# frozen_string_literal: true

require 'rails_helper'

feature 'Login Fail', driver: :selenium_chrome do

  given(:user) { create(:valid_user) }

  before { visit new_user_session_path }

  scenario 'Visitor login failure via register form' do

    within '#new_user' do
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      click_button('Log in')
    end

    expect(page).to have_content 'Invalid Email or password.'
  end

  feature 'Login Success' do

    before do
      within '#new_user' do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        user.confirm
        click_button('Log in')
      end
    end

    scenario 'Visitor login successfully via login form' do
      expect(page).to have_content 'Signed in successfully.'
      expect(page).to have_content 'Welcome to our Gallery'
    end

    scenario 'Navigation with authorized user' do
      ['Home', 'Top 5 Category', 'All Images', 'Comments', 'My Account',
       'Categories', 'Download Images', 'Add Category', 'Ru'].each do |title|
        expect(page).to have_selector('.nav-link', text: title)
      end

      find('#dropdown02', text: 'My Account').click
      ['Edit Profile', 'Log out'].each do |title|
        expect(page).to have_selector('.dropdown-item', text: title)
      end
    end

    scenario 'check link to categories' do
      click_link I18n.t('layouts.application.categories')
      expect(page.current_path).to eq categories_path(locale: :en)
    end
  end
end
