require 'rails_helper'

RSpec.feature "Editing an article" do

  before do
    @john = User.create!(email: "example@example.com", password: "password")
    @article = Article.create(title: "First Article", body: "Body of first article")


  visit "/"

 click_link "Log in"
 fill_in "Email", with: @john.email
 fill_in "Password", with: @john.password
 click_button "Log in"
end
    
 

  scenario "user updates an article" do
    visit "/"

    click_link @article.title

    click_link "Edit Article"

    fill_in "Title", with: "Updated Title of Article"
    fill_in "Body", with: "Updated body of article"

    click_button "Update Article"

    expect(page).to have_content("Article has been updated")
    expect(page.current_path).to eq(article_path(@article))


  end

  scenario "user fails to update an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: ""
    fill_in "Body", with: "Updated body of article"

    click_button "Update Article"

    expect(page).to have_content("Article has not been updated")
    expect(page.current_path).to eq(article_path(@article))



  end

end