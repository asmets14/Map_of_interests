class Interest < ActiveRecord::Base
  CATEGORY = %w(Theatre Club Museum Restaurant Bar Cafe)
  geocoded_by :address
  before_validation :activate_geocoder
  validates :address, presence: true
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  has_attached_file :thumbnail,
                    styles: { medium: "300x300#", thumb: "100x100#" } ,
                    default_url: ActionController::Base.helpers.asset_path("missing.png")
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/

  def activate_geocoder
    if longitude.nil? and latitude.nil?
      geocode
    end
  end
end
