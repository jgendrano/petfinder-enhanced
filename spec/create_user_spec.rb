require 'rails_helper'

# As a prospective user
# I want to create an account
# So I can save my preferences and use the service

# Acceptance Criteria:
# [ ] User must provide a name
# [ ] User must provide a valid email address
# [ ] User must provide a password
# [ ] User must confirm a password
# [ ] User receives an error message if they do not provide any of the above
# [ ] User successfully authenticates if they provide valid information

feature 'User signs up for an account' do
  scenario 'User provides valid information' do
    visit new_user_registration_path

    fill_in 'First name', with: 'Foo'
    fill_in 'Last name', with: 'Bar'
    fill_in 'Email', with: 'foo@bar.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content("You're in!")
    expect(page).to have_content("Sign Out")
  end

  scenario 'User does not provide information' do
    visit new_user_registration_path

    click_button 'Sign Up'

    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to_not have_content("You're in!")
  end
end
