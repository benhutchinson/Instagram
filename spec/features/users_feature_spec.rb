require 'rails_helper'

context "user not signed in: " do

  scenario "should see a log-in form and a 'sign up' link on the homepage" do
    visit('/')
    assert has_field?('username')
    assert has_field?('password')
    assert has_button?('log-in')
    expect(page).to have_link('sign-up')
  end

  scenario "should not see 'sign out' link" do
    visit('/')
    expect(page).not_to have_link('Sign out')
  end

  scenario "should be redirected to the homepage if trying to view main content" do
    visit('/posts')
    assert has_field?('username')
    assert has_field?('password')
    assert has_button?('log-in')
    expect(page).to have_link('sign-up')
  end

  scenario "should be redirected to the homepage if trying to post" do
    visit('/posts/new')
    expect(current_path).to eql "/users/sign_in"
  end

end

context "user signed-up and signed-in: " do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @current_user = User.create!(:username => 'user', :email => 'test@test.com', :password => 'password')
    login_as(@current_user, :scope => :user)
    visit '/'
  end

  scenario "should see the content and nav elements on visit to homepage" do
    expect(page).to have_content 'user'
    expect(page).to have_xpath("//img[contains(@src,'logo.svg')]")  
  end

  scenario "should not see a 'sign in' link and a 'sign up' link" do
    assert has_no_field?('username')
    assert has_no_field?('password')
    assert has_no_button?('log-in')
    expect(page).not_to have_link('sign-up')
  end

end