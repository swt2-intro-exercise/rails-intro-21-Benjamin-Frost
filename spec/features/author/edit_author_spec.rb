require 'rails_helper'

describe "Edit author page", type: :feature do
  it "should exist at 'edit_author_path' and render withour error" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
  end

  it "should store changes made to an author in the database after submitting the form" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
    page.fill_in 'author[first_name]', with: 'Not Alan'
    find('input[type="submit"]').click
    @alan.reload
    expect(@alan.first_name).to be == 'Not Alan'
  end
end
