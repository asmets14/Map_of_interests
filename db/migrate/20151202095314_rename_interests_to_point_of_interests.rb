class RenameInterestsToPointOfInterests < ActiveRecord::Migration
  def change
    rename_table :interests, :point_of_interests
  end
end
