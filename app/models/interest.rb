class Interest < ActiveRecord::Base
  has_many :bookmarkers
  has_many :users, through: :bookmarkers
  acts_as_taggable
  geocoded_by :address
  scope :published, -> {Interest.where(:published => true)}
  before_validation :activate_geocoder
  before_validation :initialize_category
  validates :address, presence: true
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  has_attached_file :thumbnail,
                    styles: { medium: "300x300#", thumb: "100x100#" } ,
                    default_url: 'https://storage.googleapis.com/geolocalisation/missing.png'
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/

  def activate_geocoder
    if longitude.nil? and latitude.nil?
      geocode
    end
  end

  def initialize_category
    unless category.nil? and Category.find_by_id(category).nil?
      self.category = Category.find_by_id(category).name
    end
  end

end
