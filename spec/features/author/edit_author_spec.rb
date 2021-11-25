require 'rails_helper'

describe "Edit author page", type: :feature do
  before {
    @test_author = FactoryBot.create :author
    visit edit_author_path(@test_author)
  }

  it "should exist at 'edit_author_path' and render withour error" do
  end

  it "should store changes made to an author in the database after submitting the form" do
    page.fill_in 'author[first_name]', with: 'Not ' + @test_author.first_name
    find('input[type="submit"]').click
    @test_author.reload
    expect(@test_author.first_name).to be == 'Not Alan'
  end
end
