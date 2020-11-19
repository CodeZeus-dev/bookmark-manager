require_relative('../../app/app')
require_relative '../../lib/bookmark'

feature "BookmarkManager_homepage" do
  scenario "expect homepage to display Bookmark Manager to the user" do
    visit '/'
    expect(page).to have_content("Bookmark Manager")
  end

  scenario 'A user can see bookmarks\' titles' do
    Bookmark.establish_connection

    # Add the test data
    Bookmark.add_bookmark('http://www.makersacademy.com', 'makersacademy')
    Bookmark.add_bookmark('http://www.destroyallsoftware.com', 'destroyallsoftware')
    Bookmark.add_bookmark('http://www.google.com', 'google')

    visit('/')
    visit('/bookmarks')

    expect(page).to have_link 'makersacademy'
    expect(page).to have_link 'destroyallsoftware'
    expect(page).to have_link 'google'
  end

  scenario 'expect homepage to have a link called Add Bookmark' do
    visit '/'
    expect(page).to have_link('Add Bookmark')
  end
end