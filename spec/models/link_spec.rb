require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence-of(:url) }
  it { should validate_presence-of(:title) }
  it { should belong_to(:user) }
end
