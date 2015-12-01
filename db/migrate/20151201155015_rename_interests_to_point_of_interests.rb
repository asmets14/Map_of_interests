class RenameInterestsToPointOfInterests < ActiveRecord::Migration
  def change
    rename_table :Interests, :PointOfInterests
  end
end
