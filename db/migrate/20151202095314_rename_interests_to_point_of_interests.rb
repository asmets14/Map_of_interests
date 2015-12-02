class RenameInterestsToPointOfInterests < ActiveRecord::Migration
  def change
    rename_table :Interests, :Point_of_interests
  end
end
