require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to post a picture' do
      visit '/posts'
      expect(page).to have_content 'No posts'
      expect(page).to have_link 'Post'
    end
  end
end