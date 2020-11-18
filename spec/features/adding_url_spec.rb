require_relative '../../app/app'

feature "Adding a Bookmark" do
  scenario 'expect homepage to have a link called Add Bookmark' do
    visit '/'
    expect(page).to have_link('Add Bookmark')
  end

  scenario 'expect /add_bookmark page to have text Type in the URL: ' do
    visit '/'
    click_link('Add Bookmark')
    expect(page).to have_content('Type in the URL:')
  end

  scenario 'expect /add_bookmark page to have a save button' do
    visit '/'
    click_link('Add Bookmark')
    expect(page).to have_button('Save')
  end

  scenario 'expect to return back to the homepage upon clicking the Save button' do
    visit '/'
    click_link('Add Bookmark')
    fill_in('new_url', with: 'https://www.codecademy.com/')
    click_button('Save')
    expect(page).to have_link('Add Bookmark')
  end

  scenario 'expect to return back to the homepage upon clicking the Save button' do
    visit '/'
    click_link('Add Bookmark')
    fill_in('new_url', with: 'https://www.codecademy.com/')
    click_button('Save')
    expect(page).to have_link('Add Bookmark')
    visit '/bookmarks'
    expect(page).to have_content('https://www.codecademy.com/')
  end
end