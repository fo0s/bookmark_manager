require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include('https://makers.tech/')
      expect(bookmarks).to include('https://relishapp.com/')
      expect(bookmarks).to include('https://www.google.com/')
    end
  end
end
