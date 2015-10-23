class Interest < ActiveRecord::Base
  CATEGORY = %w(Theatre Club Museum Restaurant Bar Cafe)
  geocoded_by :address
  before_validation :geocode
  validates :address, presence: true
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
