require_relative 'database_connection'

class URL
  def self.initialize
    DatabaseConnection.setup('bookmark_manager')
    DatabaseConnection.setup('bookmark_manager_test') if ENV['ENVIRONMENT'] == 'test'
    retrieval = DatabaseConnection.query("SELECT * FROM bookmarks;")
    @result = []
    retrieval.map { |bookmark| @result << {bookmark['id'] => [bookmark['url'], bookmark['title']]} }
  end

  def self.titles
    # extract the titles
    @titles = []
    @result.map do |entry|
      @titles << entry[entry.keys[0]]
    end
    @titles
  end
end