class DropBookmarkersTable < ActiveRecord::Migration
  def change
    def up
     drop_table :Bookmarkers
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
