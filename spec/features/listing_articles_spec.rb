require 'rails_helper'

RSpec.feature "Listing article" do

  before do
    @article1 = Article.create(title: "The first title", body: "Body of first article")
    @article2 = Article.create(title: "The second title", body: "Body of second aricle")
  end

  scenario 'List all articles' do
    visit "/"

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)


  end


end