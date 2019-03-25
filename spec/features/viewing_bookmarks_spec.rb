require 'spec_helper'

feature 'Shows content on the site' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end

  # Start of user stories

  # As a time-pressed user
  # So that I can quickly go to web sites I regularly visit
  # I would like to see a list of bookmarks
  # end

  scenario 'visiting the bookmark page' do
    visit('/bookmarks')
    expect(page).to have_content 'https://makers.tech/'
    expect(page).to have_content 'https://relishapp.com/'
    expect(page).to have_content 'https://www.google.com/'
  end
end
