require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    bookmarks = [
                'https://makers.tech/',
                'https://relishapp.com/',
                'https://www.google.com/'
                ]
    bookmarks.join
  end

  run! if app_file == $0
end
