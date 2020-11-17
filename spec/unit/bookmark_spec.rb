require 'bookmark'

describe Bookmark do

  subject(:bookmark) { described_class.new }

  it 'creates a Bookmark instance' do
    expect(bookmark).to be_instance_of(described_class)
  end
end