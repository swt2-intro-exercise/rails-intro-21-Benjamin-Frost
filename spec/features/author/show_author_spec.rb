require 'rails_helper'

describe "Show Author Page", type: :feature do
  it "should exist at 'author_path', render without error and show author details" do
    @alan = FactoryBot.create :author
    visit author_path(@alan)
    expect(page).to have_text(@alan.first_name)
    expect(page).to have_text(@alan.last_name)
    expect(page).to have_text(@alan.homepage)
  end
end
