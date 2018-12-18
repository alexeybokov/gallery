# frozen_string_literal: true

require 'spec_helper'

feature 'Admin Image', driver: :selenium_chrome do

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

  scenario 'Navigate to Images' do
    expect(page).to have_content('Images')
  end

  feature 'Manage' do

    before do
      find_link(text: 'Images').click
    end

    scenario 'See manage links' do
      expect(page).to have_content("#{image.name}")
      expect(page).to have_link('View')
      expect(page).to have_link('Edit')
      expect(page).to have_link('Delete')
    end

    feature 'View' do
      before do
        find_link(text: 'View').click
      end

      scenario 'see info' do
        expect(page).to have_content("#{image.name}")
        expect(page).to have_content('NAME')
        expect(page).to have_content('CREATED AT')
        expect(page).to have_content('UPDATED AT')
        expect(page).to have_content('PICTURE')
        expect(page).to have_content('CATEGORY')
      end
    end

    feature 'Create' do
      before do
        find_link(text: 'New Image').click
      end

      scenario 'new image' do
        expect(Image.count).to eq(1)
        fill_in 'image[name]', with: Faker::Name.name
        page.attach_file('image_picture', Rails.root + 'spec/factories/images/image.jpg')
        find('#image_user_id').find(:xpath, 'option[2]').select_option
        find('#image_category_id').find(:xpath, 'option[1]').select_option
        find('#image_submit_action').click
        expect(page).to have_content('Image was successfully created.')
        expect(Image.count).to eq(2)
      end
    end

    feature 'Edit' do
      before do
        find_link(text: 'Edit').click
      end

      scenario 'change Image name' do
        fill_in 'image[name]', with: 'Change name'
        find('#image_submit_action').click
        expect(page).to have_content('Image was successfully updated.')
        expect(page).to have_content('Change name')
      end

      scenario 'change Image category' do
        find('#image_category_id').find(:xpath, 'option[1]').select_option
        find('#image_submit_action').click
        expect(page).to have_content('Image was successfully updated.')
      end

      scenario 'change Image creator' do
        find('#image_user_id').find(:xpath, 'option[2]').select_option
        find('#image_submit_action').click
        expect(page).to have_content('Image was successfully updated.')
      end
    end

    feature 'Delete' do
      scenario 'remove image' do
        expect(Image.count).to eq(1)
        find_link(text: 'Delete').click
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content('Image was successfully destroyed.')
        visit admin_user_session_path
        expect(Image.count).to eq(0)
      end
    end
  end
end
