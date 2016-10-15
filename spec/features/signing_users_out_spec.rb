require "rails_helper"

RSpec.feature "User Log out" do

before do
    @john = User.create!(email: "example@example.com", password: "password")

  visit "/"

 click_link "Log in"
 fill_in "Email", with: @john.email
 fill_in "Password", with: @john.password
 click_button "Log in"
end

scenario do
  visit "/"
  click_link "Log out"
  expect(page).to have_content("Signed out successfully")
end



end