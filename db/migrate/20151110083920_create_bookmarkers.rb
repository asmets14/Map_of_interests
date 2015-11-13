class CreateBookmarkers < ActiveRecord::Migration
  def change
    create_table :bookmarkers do |t|
      t.integer :user_id
      t.integer :interest_id
      t.timestamps
    end
  end
end
