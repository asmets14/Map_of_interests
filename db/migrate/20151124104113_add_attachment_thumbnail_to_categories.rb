class AddAttachmentThumbnailToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :categories, :thumbnail
  end
end
