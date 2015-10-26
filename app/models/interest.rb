class Interest < ActiveRecord::Base
  CATEGORY = %w(Theatre Club Museum Restaurant Bar Cafe)
  geocoded_by :address
  before_validation :activate_geocoder
  validates :address, presence: true
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  def activate_geocoder
    if longitude.nil? and latitude.nil?
      geocode
    end
  end
end
