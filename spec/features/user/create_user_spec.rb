require "rails_helper"

feature "user signs up", %Q{
  As a prospective user
  I want to create an account
  So I can save my preferences and use the service
} do

# Acceptance Criteria:
# [ ] User must provide a name
# [ ] User must provide a valid email address
# [ ] User must provide a password
# [ ] User must confirm a password
# [ ] User receives an error message if they do not provide any of the above
# [ ] User successfully authenticates if they provide valid information



scenario "User provides valid information" do
    visit root_path
    click_link "Sign Up"
    fill_in "User Name", with: "testuser"
    fill_in "Email", with: "foo@bar.com"
    fill_in "Phone Number", with: "1234567890"
    fill_in "Security Question", with: "What is your Veterinarian's Name?"
    fill_in "Answer", with: "Smith"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario "User does not provide valid information" do
    visit root_path
    click_link "Sign Up"
    click_button "Sign up"

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
    expect(page).to_not have_content("You're in!")
  end

  scenario "password confirmation doesn't match entered password" do
    visit root_path
    click_link "Sign Up"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "doesntmatch"
    click_button "Sign up"

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end
end
