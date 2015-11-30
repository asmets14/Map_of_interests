class Category < ActiveRecord::Base
  has_many :interests
  has_attached_file :thumbnail,
                    styles: { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/

  def decorate
    {
      :name => name,
      :icon_url => thumbnail.url,
      :category_id => id
    }
  end
end
