require 'rails_helper'

RSpec.describe "papers/show", type: :view do
  before(:each) do
    @author = FactoryBot.create :author
    @paper = assign(:paper, Paper.create!(
      title: "Title",
      venue: "Venue",
      year: 2
    ))
    @paper.authors = [ @author ]
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Venue/)
    expect(rendered).to match(/2/)
  end

  it "should show the author's full name" do
    render
    expect(rendered).to have_text(@paper.authors.first().name)
  end
end
