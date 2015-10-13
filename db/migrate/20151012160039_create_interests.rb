class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :name
      t.string :category
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
