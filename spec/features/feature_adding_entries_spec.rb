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

    connection = PG.connect(dbname: 'daily_diary_test')
      #test data
    connection.exec("INSERT INTO entries (id, title) VALUES (1, 'My second entry');")

    visit ('/new-entry')
    fill_in 'Title', with: 'My second entry'
    click_button("Add")
    expect(page).to have_content("You've added an entry called: My second entry")
    find_link('Return to homepage').visible?
  end
end

  # click_button("See my entries")