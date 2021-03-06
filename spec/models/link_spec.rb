require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:title) }
  it { should belong_to(:user) }

  it "should check if url valid" do
    link = Link.new(title: "Love", url: "lovefest")
    expect(link.valid?).to be false
  end

  it "should have false as default on read" do
    link = Link.create(title: "Winner", url: "http://hilary.com", user_id: 1 )

    expect(link.read).to eq false
  end
end
