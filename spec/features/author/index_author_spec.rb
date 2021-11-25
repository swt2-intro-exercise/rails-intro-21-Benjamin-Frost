require 'rails_helper'

describe "Index author page", type: :feature do
  it "should exist at 'authors_path' and render without an error and contain the list of authors" do
    visit authors_path

    expect(page).to have_table
    expect(page).to have_css('th', text: 'Name')
    expect(page).to have_css('th', text: 'Homepage')
  end

  it "should contain a link to create a new author" do
    visit authors_path
    expect(page).to have_link 'New', href: new_author_path
  end

  it "should contain a link to edit an author" do
    visit authors_path
    expect(page).to have_link 'Edit', href: edit_author_path
  end
end
