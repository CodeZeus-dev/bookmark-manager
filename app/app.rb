require 'sinatra/base'
require_relative '../lib/bookmark'

class BookmarkManager < Sinatra::Application
  get '/' do
    Bookmark.establish_connection
    erb :index
  end

  get '/bookmarks' do
    @urls = Bookmark.all
    erb :bookmark
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/bookmarks' do
    Bookmark.add_bookmark(params[:new_url])
    redirect '/'
  end

  run! if app_file == $0
end