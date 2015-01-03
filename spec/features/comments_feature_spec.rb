# require 'rails_helper'

# feature 'commenting' do

#   include Warden::Test::Helpers
#   Warden.test_mode!

#   before do
#     @current_user = User.create!(:username => 'user', :email => 'test@test.com', :password => 'password')
#     @second_user = User.create!(:username => 'second', :email => 'second@test.com', :password => 'secondpass')
#     login_as(@current_user, :scope => :user)
#     visit '/'
#     click_link('submit a photo')
#     fill_in "post_comment", :with => 'totes amazeballs'
#     click_button "// post"
#   end

#   scenario 'logged-in users can leave comments on posts', js: true do
#      visit '/posts'
#      fill_in ('comment_comments'), :with => "so so\n"
#      # visit '/posts'
#       # does that simulate the delay? 
#       expect(Post.last.comments.count).to be 1 not working...

#      # save_and_open_page

#      # expect(page).to have_content('so so')
#   end

# end