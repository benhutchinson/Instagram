require 'rails_helper'

context "user not signed in" do

  it "should see a log-in form and a 'sign up' link on the homepage" do
    visit('/')
    assert has_field?('username')
    assert has_field?('password')
    assert has_button?('log-in')
    expect(page).to have_link('sign-up')
  end

  it "should not see 'sign out' link" do
    visit('/')
    expect(page).not_to have_link('Sign out')
  end

  it "should be redirected to the homepage if trying to view main content" do
    visit('/posts')
    assert has_field?('username')
    assert has_field?('password')
    assert has_button?('log-in')
    expect(page).to have_link('sign-up')
  end

  it "should be redirected to the homepage if trying to post" do
    visit('/posts/new')
    expect(current_path).to eql "/users/sign_in"
  end

end

context "user signed-up and signed-in" do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @current_user = User.create!(:username => 'user', :email => 'test@test.com', :password => 'password')
    login_as(@current_user, :scope => :user)
    visit '/'
  end

  it "should go straight to content and see 'no posts' if there is no content" do
    expect(page).to have_content 'No posts'
    expect(page).to have_link 'Post'
  end

  it "should not see a 'sign in' link and a 'sign up' link" do
    assert has_no_field?('username')
    assert has_no_field?('password')
    assert has_no_button?('log-in')
    expect(page).not_to have_link('sign-up')
  end

end