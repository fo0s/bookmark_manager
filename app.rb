require 'sinatra/base'
require './lib/bookmark'
require 'pg'

# Bookmark page
class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all

    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
