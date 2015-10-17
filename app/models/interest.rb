class Interest < ActiveRecord::Base
  CATEGORY = %w(Theatre Club Museum)
  validates :address, presence: true
  validates :name, presence: true
  geocoded_by :address
  after_validation :geocode
end
