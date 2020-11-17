require 'bookmark'

describe Bookmark do

  subject(:bookmark) { described_class.new }

  it 'creates a Bookmark instance' do
    expect(bookmark).to be_instance_of(described_class)
  end

  context "#initialize" do
    it "creates a list of urls" do
      expect(bookmark.url_list.is_a?(Array)).to eq(true)
    end
  end
end