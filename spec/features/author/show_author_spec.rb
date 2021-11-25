require 'rails_helper'

describe "Show author page", type: :feature do
  before {
    @test_author = FactoryBot.create :author
    visit author_path(@test_author)
  }

  it "should exist at 'author_path', render without error and show author details" do
    expect(page).to have_text(@test_author.first_name)
    expect(page).to have_text(@test_author.last_name)
    expect(page).to have_text(@test_author.homepage)
  end
end
