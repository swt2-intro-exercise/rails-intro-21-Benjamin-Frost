require 'rails_helper'

describe "New author page", type: :feature do
  before {
    visit new_author_path
  }

  it "should exist at 'new_author_path' and render withour error" do
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should store a new author in the database after submitting the form" do
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: 'Turing'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click
  end

  it "should show an error message when last_name is missing" do
    find('input[type="submit"]').click
    expect(page).to have_text('error')
  end
end
