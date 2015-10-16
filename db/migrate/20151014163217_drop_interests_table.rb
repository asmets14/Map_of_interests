class DropInterestsTable < ActiveRecord::Migration
  def change
    def up
     drop_table :Interests
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
