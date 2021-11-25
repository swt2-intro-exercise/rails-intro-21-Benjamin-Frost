require 'rails_helper'

describe "Index paper page", type: :feature do
  before {
    @test_paper = FactoryBot.create :paper
    visit papers_path
  }

  it "should be able to filter by a certain year" do
    other_paper = Paper.create(title: 'Paper 2', venue: "Venue 2", year: 2002)

    visit papers_path(year: @test_paper.year)
    expect(page).to have_text(@test_paper.title)
    expect(page).to_not have_text(other_paper.title)
  end
end
