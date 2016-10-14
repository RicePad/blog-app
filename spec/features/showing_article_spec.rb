require 'rails_helper'

RSpec.feature "Showing an article" do

  before do
    @article = Article.create(title: "Title of first article", body: "body of the first article")
  end

  scenario 'Display individual article' do
    visit "/"

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

  end


end