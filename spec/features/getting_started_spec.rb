feature "getting to the homepage" do
  scenario "user visits home page and sees welcome screen" do
    visit ('/')
    expect(page).to have_content("My Diary")
  end
end

feature "navigating to add new entry" do
  scenario "user adds a new entry" do
    visit ('/')
    click_button("Create a new entry")
    expect(page).to have_content("Title")
    expect(page).to have_content("Fill me in")
  end
end

feature "Adding new entry" do
  scenario "User submits title of entry" do
    visit ('/new-entry')
    fill_in 'Title', with: 'My first entry'
    click_button("Add")
    expect(page).to have_content("You've added an entry called: My first entry")
  end
end

  # click_button("See my entries")