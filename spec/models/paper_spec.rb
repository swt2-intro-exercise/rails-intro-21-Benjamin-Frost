require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "attributes set properly" do
    paper = Paper.new(
      title: "Best Paper World",
      venue: "Best Venue World",
      year: 1930
    )

    expect(paper.title).to eq("Best Paper World")
    expect(paper.venue).to eq("Best Venue World")
    expect(paper.year).to eq(1930)
  end

  it "should not be valid without having all attributes set" do
    paper = Paper.new()
    expect(paper).to_not be_valid

    paper.title = "Some Title"
    expect(paper).to_not be_valid

    paper.venue = "Some Venue"
    expect(paper).to_not be_valid

    paper.year = "Some Year"
    expect(paper).to_not be_valid

    paper.year = 1999
    expect(paper).to be_valid
  end

  it "should have an empty list of authors" do
    paper = Paper.new()
    expect(paper.authors).to be_empty
  end

  it "should be able to filter papers by a certain year" do
    paper1 = Paper.new(title: 'Paper 1', venue: "Venue 1", year: 2001)
    paper2 = Paper.new(title: 'Paper 2', venue: "Venue 2", year: 2002)
    expect(Paper.count).to eq(2)

    filtered_list = Paper.published_in(paper1.year)
    expect(filtered_list.length).to eq(1)
    expect(filtered_list.first().title).to eq(paper1.title)
  end
end
