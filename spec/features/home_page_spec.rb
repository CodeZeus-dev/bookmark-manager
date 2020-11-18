require_relative('../../app/app')
require_relative '../../lib/bookmark'

feature "BookmarkManager_homepage" do
  scenario "expect homepage to display Bookmark Manager to the user" do
    visit '/'
    expect(page).to have_content("Bookmark Manager")
  end

  scenario 'A user can see bookmarks' do
    Bookmark.establish_connection

    # Add the test data
    Bookmark.add_bookmark('http://www.makersacademy.com')
    Bookmark.add_bookmark('http://www.destroyallsoftware.com')
    Bookmark.add_bookmark('http://www.google.com')

    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end

  scenario 'expect homepage to have a link called Add Bookmark' do
    visit '/'
    expect(page).to have_link('Add Bookmark')
  end
end