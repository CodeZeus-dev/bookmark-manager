require 'bookmark'

describe Bookmark do

  subject(:bookmark) { described_class.new }

  it 'creates a Bookmark instance' do
    expect(bookmark).to be_instance_of(described_class)
  end

  context "#self.all" do
    it "returns the list of urls" do
      expect(Bookmark.all.is_a?(Array)).to eq(true)
    end

    it 'returns the urls passed in by the user' do
      expect(Bookmark.all).to include("https://www.google.com/")
      expect(Bookmark.all).to include("http://www.twitter.com/")
      expect(Bookmark.all).to include("http://www.makersacademy.com/")
    end
  end
end