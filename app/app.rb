require 'sinatra/base'
require_relative '../lib/bookmark'
require_relative '../lib/url'

class BookmarkManager < Sinatra::Application
  get '/' do
    Bookmark.establish_connection
    @url = URL
    @url.initialize
    erb :index
  end

  get '/bookmarks' do
    @url = URL
    erb :bookmark
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/bookmarks' do
      Bookmark.add_bookmark(params[:new_url], params[:url_title])
    redirect '/'
  end

  run! if app_file == $0
end