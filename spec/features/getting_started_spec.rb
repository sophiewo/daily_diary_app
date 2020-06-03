feature "getting to the homepage" do
  scenario "user visits home page and sees welcome screen" do
    visit ('/')
    expect(page).to have_content("My Diary")
  end
end