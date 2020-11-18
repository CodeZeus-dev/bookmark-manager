require_relative './database_connection'

class Bookmark

  def self.establish_connection
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('bookmark_manager_test')
    else
      DatabaseConnection.setup('bookmark_manager')
    end
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.add_bookmark(url)
    DatabaseConnection.query("INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end

end