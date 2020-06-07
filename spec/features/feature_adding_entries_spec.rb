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
  xscenario "User submits title of entry" do

    connection = PG.connect(dbname: 'daily_diary_test')
      #test data
    connection.exec("INSERT INTO entries (id, title, body) VALUES (1, 'My second entry', 'I feel 7/10 today');")

    visit ('/new-entry')
    fill_in 'Title', with: 'My second entry'
    fill_in 'body', with: 'I feel 7/10 today'

    click_button("Add")
    expect(page).to have_content("My second entry")
    expect(page).to have_content("I feel 7/10 today")

    
  end
end

  # click_button("See my entries")