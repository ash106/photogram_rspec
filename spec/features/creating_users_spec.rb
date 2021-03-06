require 'rails_helper'

feature "Creating a new user" do
  background do
    visit '/'
    click_link 'Register'
  end

  scenario "can create a new user via the index page" do
    fill_in 'User name', with: 'sxyrailsdev'
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
    fill_in 'Password', with: 'supersecret', match: :first
    fill_in 'Password confirmation', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "requires a user name to successfully create an account" do
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
    fill_in 'Password', with: 'supersecret', match: :first
    fill_in 'Password confirmation', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario "requires a user name to be 4 characters minimum" do
    fill_in 'User name', with: 'h'
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
    fill_in 'Password', with: 'supersecret', match: :first
    fill_in 'Password confirmation', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content("minimum is 4 characters")
  end

  scenario "requires a user name to be 12 characters maximum" do
    fill_in 'User name', with: 'h' * 13
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
    fill_in 'Password', with: 'supersecret', match: :first
    fill_in 'Password confirmation', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content("maximum is 12 characters")
  end
end