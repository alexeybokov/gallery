# frozen_string_literal: true

require 'rails_helper'

feature 'Login' do

  given(:user) { create(:valid_user) }

  before { visit new_user_session_path }

  scenario 'Visitor login successfully via login form' do

    within '#new_user' do
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      user.confirm
      click_button('Log in')
    end

    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'Welcome to our Gallery'
    expect(page).to have_content 'Account'
  end

  scenario 'Visitor login failure via register form' do

    within '#new_user' do
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      click_button('Log in')
    end

    expect(page).to have_content 'Invalid Email or password.'
  end
end
