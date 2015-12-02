class RenamePointOfInterestsToPointOfInterests < ActiveRecord::Migration
  def change
    rename_table :PointOfInterests, :Point_of_interests
  end
end
