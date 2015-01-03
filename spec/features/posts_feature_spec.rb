require 'rails_helper'

feature 'posts: ' do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @current_user = User.create!(:username => 'user', :email => 'test@test.com', :password => 'password')
    @second_user = User.create!(:username => 'second', :email => 'second@test.com', :password => 'secondpass')
    login_as(@current_user, :scope => :user)
    visit '/'
  end

  context 'have not yet been added' do
    scenario 'should display a prompt to post a picture' do
      expect(page).to have_content 'No posts'
      expect(page).to have_link 'Post'
    end
  end

  context 'adding new posts' do
    scenario 'prompts a user to fill out a form, and then displays the new post' do
      visit '/posts'
      click_link('submit a photo')
      fill_in "post_comment", :with => 'great shot'
      click_button "// post"
      expect(page).to have_content 'great shot'
      expect(current_path).to eq '/posts'
    end
  end

  context 'existing posts' do
    before do
      visit '/posts'
      click_link('submit a photo')
      fill_in "post_comment", :with => 'totes amazeballs'
      click_button "// post"
    end

    scenario 'show posts' do
      logout(:user)
      visit '/posts'
      expect(page).to have_link('sign-up')
      login_as(@second_user, :scope => :user)
      visit '/posts'
      expect(page).to have_content('totes amazeballs')
      expect(page).not_to have_content('No posts')
    end
  end

  context 'deleting posts' do
    before do
      visit '/posts'
      click_link('submit a photo')
      fill_in "post_comment", :with => 'totes amazeballs'
      click_button "// post"
    end

    scenario 'a user can remove a post they have created when they click the delete link' do
      click_link('delete-post')
      expect(page).not_to have_content 'totes amazeballs'
      expect(page).to have_content('No posts')
    end

    scenario 'a user does not see a link to delete posts that they have not created' do
      logout(:user)
      login_as(@second_user, :scope => :user)
      visit '/posts'
      expect(page).to have_content 'totes amazeballs'
      expect(page).not_to have_link('delete-post')
    end
  end

end