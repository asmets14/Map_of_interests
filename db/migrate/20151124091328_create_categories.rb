class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.boolean :published, :default => false
      t.string :name
    end
  end
end
