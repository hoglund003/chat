require 'rails_helper'

RSpec.describe Channel, type: :model do
  let(:channel) { build(:channel) }
  it 'should have name' do
    expect(:channel.name).to_not be(blank?)
  end
end
