class AddAttachmentThumbnailToInterests < ActiveRecord::Migration
  def self.up
    change_table :interests do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :interests, :thumbnail
  end
end
