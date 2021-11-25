require 'rails_helper'

describe "New paper page", type: :feature do
  before {
    visit new_paper_path
  }

  it "should exist at 'new_paper_path' and render withour error" do
  end

  it "should have inputs for all paper properties" do
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
    expect(page).to have_field('paper[author_ids][]')
  end
end
