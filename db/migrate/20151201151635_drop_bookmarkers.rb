class DropBookmarkers < ActiveRecord::Migration
  def change
    drop_table :bookmarkers
  end
end
