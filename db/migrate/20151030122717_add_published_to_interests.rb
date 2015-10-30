class AddPublishedToInterests < ActiveRecord::Migration
  def change
    add_column :interests, :published, :boolean, :default => true
  end
end
