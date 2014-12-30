require 'rails_helper'

feature 'liking posts' do
  before do
    dummy_post = Post.create(username: 'benhutch', comment: 'a little david bailey')
  end

  scenario 'a user can like a post, which updates the likes count', js: true do
    visit '/posts'
    click_link 'like'
    expect(page).to have_content('1 like')
  end

end