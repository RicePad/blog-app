require 'rails_helper'

RSpec.feature "User Sign Up" do

  scenario "Sign up with valid credentials" do

    visit "/"

    click_link "Sign Up"
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirm password", with: "password"

    click_button "Sign up"


    expect(page).to have_content("You have signed up successfully.")

  end

end