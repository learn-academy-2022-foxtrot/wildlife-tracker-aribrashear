require 'rails_helper'
RSpec.describe Sighting, type: :model do

  it 'must include latitude' do
    sighting = Sighting.create(longitude: '12.0452', date: '2022-01-23')
    expect(sighting.errors[:latitude]).to_not be_empty
  end

  it 'must include longitude' do
    sighting = Sighting.create(latitude: "-10.0934", date: '2022-01-23')
    expect(sighting.errors[:longitude]).to_not be_empty
  end

  it 'must include a date' do
    sighting = Sighting.create(latitude: "-10.0934", longitude: '12.0452')
    expect(sighting.errors[:date]).to_not be_empty
  end


end
