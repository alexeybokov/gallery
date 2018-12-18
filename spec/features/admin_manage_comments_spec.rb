# frozen_string_literal: true

require 'spec_helper'

feature 'Admin Comment', driver: :selenium_chrome do
  given!(:admin) { create(:admin_user) }
  given!(:user) { create(:valid_user) }
  given!(:category) { create(:valid_category) }
  given!(:image) { create(:valid_image, category: category) }
  given!(:comment) { create(:valid_comment, image: image) }

  before do
    login_as user, scope: :user
    visit admin_user_session_path
    fill_in 'admin_user[email]', with: admin.email
    fill_in 'admin_user[password]', with: admin.password
    click_button('Login')
  end

  scenario 'Navigate to Comments' do
    expect(page).to have_content('Comments')
  end

  feature 'Manage' do
    before do
      find_link(text: 'Comments').click
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
        expect(page).to have_content('BODY')
        expect(page).to have_content('CREATED AT')
        expect(page).to have_content('UPDATED AT')
        expect(page).to have_content('IMAGE')
        expect(page).to have_content('USER')
      end
    end

    feature 'Create' do
      before do
        find_link(text: 'New Comments').click
      end

      scenario 'new comments' do
        expect(Comment.count).to eq(1)
        fill_in 'comment[body]', with: Faker::Lorem.sentence(3, true, 10)
        find('#comment_user_id').find(:xpath, 'option[2]').select_option
        find('#comment_image_id').find(:xpath, 'option[1]').select_option
        find('#comment_submit_action').click
        expect(page).to have_content('Comment was successfully created.')
        expect(Comment.count).to eq(2)
      end
    end

    feature 'Edit' do
      before do
        find_link(text: 'Edit').click
      end

      scenario 'change Comment body' do
        fill_in 'comment[body]', with: 'New text'
        find('#comment_submit_action').click
        expect(page).to have_content('Comment was successfully updated.')
        expect(page).to have_content('New text')
      end

      scenario 'change Comment image' do
        find('#comment_image_id').find(:xpath, 'option[1]').select_option
        find('#comment_submit_action').click
        expect(page).to have_content('Comment was successfully updated.')
      end

      scenario 'change Comment creator' do
        find('#comment_user_id').find(:xpath, 'option[2]').select_option
        find('#comment_submit_action').click
        expect(page).to have_content('Comment was successfully updated.')
      end
    end

    feature 'Delete' do
      scenario 'remove comments' do
        expect(Comment.count).to eq(1)
        find_link(text: 'Delete').click
        page.driver.browser.switch_to.alert.accept
        visit admin_user_session_path
        expect(Comment.count).to eq(0)
      end
    end
  end
end
