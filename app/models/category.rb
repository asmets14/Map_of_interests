class Category < ActiveRecord::Base
  has_attached_file :thumbnail,
                    styles: { medium: "300x300#", thumb: "100x100#" } ,
                    default_url: 'https://storage.googleapis.com/geolocalisation/missing.png'
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/

  def decorate
    {
      :name => name,
      :icon_url => thumbnail.url
    }
  end
end