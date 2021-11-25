require 'rails_helper'

describe "Edit paper page", type: :feature do
  before {
    @test_paper = FactoryBot.create :paper
    visit edit_paper_path(@test_paper)
  }

  it "should exist at 'edit_paper_path' and render withour error" do
  end

  it "should have inputs for all paper properties" do
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
    expect(page).to have_field('paper[author_ids][]')
  end
end
