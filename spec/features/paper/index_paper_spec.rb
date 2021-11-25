require 'rails_helper'

describe "Index paper page", type: :feature do
  it "should be able to filter by a certain year" do
    paper1 = Paper.create(title: 'Paper 1', venue: "Venue 1", year: 2001)
    paper2 = Paper.create(title: 'Paper 2', venue: "Venue 2", year: 2002)

    visit papers_path(year: paper1.year)
    expect(page).to have_text(paper1.title)
    expect(page).to_not have_text(paper2.title)
  end
end
