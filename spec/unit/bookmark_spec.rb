require 'bookmark'

describe Bookmark do

  subject(:bookmark) { described_class.new }

  it 'creates a Bookmark instance' do
    expect(bookmark).to be_instance_of(described_class)
  end

  context "#self.all" do
    it "returns an instance of the Array class" do
      expect(Bookmark.all.is_a?(Array)).to eq(true)
    end

    it 'returns a list of urls' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

      expect(Bookmark.all).to eq(%w(http://www.makersacademy.com
                                    http://www.destroyallsoftware.com
                                    http://www.google.com))
    end
  end
end