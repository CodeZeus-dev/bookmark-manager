require 'sinatra/base'
require_relative '../lib/bookmark'

class BookmarkManager < Sinatra::Application
  get '/' do
    "Bookmark Manager"
  end

  get '/bookmark' do
    @urls = Bookmark.new.url_list
    erb :bookmark
  end

  run! if app_file == $0
end