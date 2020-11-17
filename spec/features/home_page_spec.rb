require_relative('../../app/app')

feature "BookmarkManager_homepage" do
  scenario "expect homepage to display Bookmark Manager to the user" do
    visit '/'
    expect(page).to have_content("Bookmark Manager")
  end

  scenario "expect to see the saved urls on the homepage" do
    visit '/bookmark'
    expect(page).to have_content(/(http)(s)*:\/\//)
  end
end