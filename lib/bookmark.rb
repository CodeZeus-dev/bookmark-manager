require_relative './database_connection'

class Bookmark

  def self.establish_connection
    DatabaseConnection.setup('bookmark_manager')
    DatabaseConnection.setup('bookmark_manager_test') if ENV['ENVIRONMENT'] == 'test'
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.add_bookmark(url, url_title)
    # if url_title is an empty string, url_title is automatically set to the domain name of the url
    url_title = /(?:http)(?:s*)(?::)(?:\/\/)(?:www)(?:.)([a-zA-Z0-9\-]+)/.match(url).captures[0] if url_title = ""
    DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{url_title}')")
  end

end