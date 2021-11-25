require 'rails_helper'

describe "Show paper page", type: :feature do
  before {
    @test_paper = FactoryBot.create :paper
    @test_author = FactoryBot.create :author
    @test_paper.authors.push(@test_author)
    visit paper_path(@test_paper)
  }

  it "should exist at 'paper_path', render without error and show author details" do
    expect(page).to have_text(@test_paper.title)
    expect(page).to have_text(@test_paper.venue)
    expect(page).to have_text(@test_paper.year)
  end

  it "should show the author's full name" do
    expect(page).to have_text(@test_author.name)
  end
end
