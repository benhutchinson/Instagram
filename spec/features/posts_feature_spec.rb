require 'rails_helper'

feature 'posts' do
  context 'have not yet been added' do
    scenario 'should display a prompt to post a picture' do
      visit '/posts'
      expect(page).to have_content 'No posts'
      expect(page).to have_link 'Post'
    end
  end

  context 'have been added' do
    before do
      Post.create(username: 'ben', comment: 'busted, i am the real david bailey')
    end

    scenario 'show posts' do
      visit '/posts'
      expect(page).to have_content('david bailey')
      expect(page).not_to have_content('No posts')
    end
  end

end