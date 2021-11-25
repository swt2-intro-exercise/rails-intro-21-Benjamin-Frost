require 'rails_helper'

RSpec.describe Paper, type: :model do
  paper = Paper.new(
    title: "Best Paper World",
    venue: "Best Venue World",
    year: 1930
  )

  it "attributes set properly" do
    expect(paper.title).to eq("Best Paper World")
    expect(paper.venue).to eq("Best Venue World")
    expect(paper.year).to eq(1930)
  end

  it "should not be valid without having all attributes set" do
    paper = Paper.new()
    expect(paper).to_not be_valid

    paper.title = "Some Title"
    expect(paper).to_not be_valid

    paper.vanue = "Some Venue"
    expect(paper).to_not be_valid

    paper.year = "Some Year"
    expect(paper).to_not be_valid

    paper.year = 1999
    expect(paper).to be_valid
  end
end
