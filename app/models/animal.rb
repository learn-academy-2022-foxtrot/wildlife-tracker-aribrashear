class Animal < ApplicationRecord
  has_many :sightings

  validates :common_name, :scientific_binomial, presence: true
  validates :scientific_binomial, comparison: { other_than: :common_name  }
  validates :common_name, :scientific_binomial, uniqueness: true


end
