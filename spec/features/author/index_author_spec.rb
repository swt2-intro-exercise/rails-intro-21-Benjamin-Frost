require 'rails_helper'

describe "Index author page", type: :feature do
  before {
    @test_author = FactoryBot.create :author
    visit authors_path
  }

  it "should exist at 'authors_path', render without an error and contain the list of authors" do
    expect(page).to have_table
    expect(page).to have_css('th', text: 'Name')
    expect(page).to have_css('th', text: 'Homepage')
  end

  it "should have a table with all authors" do
    within 'table' do
      expect(page).to have_text(@test_author.name)
      expect(page).to have_text(@test_author.homepage)
    end
  end

  it "should contain a link to create a new author" do
    expect(page).to have_link('New Author', href: new_author_path)
  end

  it "should contain links to show/edit/delete an author" do
    within 'table' do
      expect(page).to have_link('Show', href: author_path(@test_author))
      expect(page).to have_link('Edit', href: edit_author_path(@test_author))
      expect(page).to have_link('Delete', href: author_path(@test_author))
    end
  end

  it "delete link should delete an author" do
    count = Author.count
    click_link 'Delete'
    expect(Author.count).to eq(count - 1)
  end
end
