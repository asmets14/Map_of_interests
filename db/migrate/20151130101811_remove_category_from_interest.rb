class RemoveCategoryFromInterest < ActiveRecord::Migration
  def change
    remove_column :interests, :category, :string
  end
end
