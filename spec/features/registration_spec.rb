# frozen_string_literal: true

require 'rails_helper'

feature 'Registration' do

  before { visit new_user_registration_path }

  scenario 'click sign up with blank fields' do
    expect { click_button('Sign up') }.not_to change(User, :count)
  end

  scenario 'Visitor registers successfully via register form' do
    within '#new_user' do
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Password', with: '12345678'
      click_button 'Sign up'
    end
    expect(page).to have_content 'Sign up'
    expect(page).to have_content 'Log in'
    # expect(page).not_to have_content 'Sign out'
    # expect(page).to have_content 'You registered'
  end
end
