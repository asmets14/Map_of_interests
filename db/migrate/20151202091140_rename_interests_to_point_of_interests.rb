class RenameInterestsToPointOfInterests < ActiveRecord::Migration
  def change
    rename_table :Interests, :Pointofinterests
  end
end
