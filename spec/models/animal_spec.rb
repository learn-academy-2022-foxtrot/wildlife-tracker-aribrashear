require 'rails_helper'

# Can see a status code of 422 when a post request can not be completed because of validation errors
# Hint: Handling Errors in an API Application the Rails Way
# Story 5: In order to increase efficiency, as a user of the API, I need to add an animal and a sighting at the same time.
RSpec.describe Animal, type: :model do

  it 'must include a common name' do
    animal = Animal.create(scientific_binomial: 'Biggus Cattus')
    expect(animal.errors[:common_name]).to_not be_empty
  end

  it 'must include a scientific binomial' do
    animal = Animal.create(common_name: 'Lion')
    expect(animal.errors[:scientific_binomial]).to_not be_empty
  end

  it 'cannot have the same common name and scientific binomial' do
    animal = Animal.create(common_name: 'Cheetah', scientific_binomial: 'Cheetah')
    expect(animal.errors[:scientific_binomial]).to_not be_empty
  end

  it 'must have a unique common name' do
    Animal.create(common_name: 'Tiger', scientific_binomial: 'Biggus Cattus')
    animal = Animal.create(common_name: 'Tiger', scientific_binomial: 'Largus Cattus')
    expect(animal.errors[:common_name]).to_not be_empty
  end

  it 'must have a unique scientific binomial' do
    Animal.create(common_name: 'Leopard', scientific_binomial: 'Biggus Cattus')
    animal = Animal.create(common_name: 'Bobcat', scientific_binomial: 'Biggus Cattus')
    expect(animal.errors[:scientific_binomial]).to_not be_empty
  end


end
