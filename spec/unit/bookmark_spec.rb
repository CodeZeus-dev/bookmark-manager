require 'bookmark'

describe Bookmark do

  context "#self.all" do
    it "returns an instance of the Array class" do
      expect(Bookmark.all.is_a?(Array)).to eq(true)
    end

    it 'returns a list of urls' do
      described_class.establish_connection

      # Add the test data
      described_class.add_bookmark('http://www.makersacademy.com', 'makersacademy')
      described_class.add_bookmark('http://www.destroyallsoftware.com', 'destroyallsoftware')
      described_class.add_bookmark('http://www.google.com', 'google')

      expect(Bookmark.all).to eq(%w(http://www.makersacademy.com
                                    http://www.destroyallsoftware.com
                                    http://www.google.com))
    end
  end

  context "#self.add_bookmark" do
    it 'is called on the Bookmark class itself' do
      expect(described_class).to respond_to(:add_bookmark).with(2).arguments
    end

    it 'adds a new bookmark in the database' do
      described_class.establish_connection
      described_class.add_bookmark('https://www.google.com/', 'google')
      expect(described_class.all).to include('https://www.google.com/')
    end
  end

  context '#self.establish_connection' do
    it 'is called on the Bookmark class' do
      expect(described_class).to respond_to(:establish_connection)
    end

    it 'checks that connection to the database has been established' do
      described_class.establish_connection
      expect(DatabaseConnection.connection).not_to be_nil
    end

  end

end