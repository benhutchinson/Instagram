# require 'rails_helper'

# feature 'liking posts' do

#   include Warden::Test::Helpers
#   Warden.test_mode!

#   before do
#     @current_user = User.create!(:username => 'user', :email => 'test@test.com', :password => 'password')
#     login_as(@current_user, :scope => :user)
#     visit '/'
#     expect(page).to have_content 'No posts'
#     expect(page).to have_link 'Post'
#     click_link('submit a photo')
#     fill_in "post_comment", :with => 'great shot'
#     click_button "// post"
#     expect(page).to have_content 'great shot'
#   end

#   context "when user is signed in" do
#     scenario 'a user can like a post, which updates the likes count', js: true do
#       visit '/'
#       expect(page).to have_content '0 likes'
#       click_link('like-button')
#       expect(page).to have_content '1 like'
#     end
#   end

# end