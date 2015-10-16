class Interest < ActiveRecord::Base
  CATEGORY = %w(Theatre Club Museum)
  geocoded_by :address
  after_validation :geocode

  
end
