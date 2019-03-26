require 'spec_helper'
require 'pg'

feature 'Shows content on the site' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'Bookmark Index'
  end

  # Start of user stories

  # As a time-pressed user
  # So that I can quickly go to web sites I regularly visit
  # I would like to see a list of bookmarks
  # end
end

feature 'viewing bookmarks' do
  scenario 'bookmarks are visible' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmark.create(url: 'http://www.google.com', title: 'Google')

    visit '/bookmarks'

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
