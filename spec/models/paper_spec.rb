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
end
