class AddCategoryIdToInterest < ActiveRecord::Migration
  def change
    add_column :interests, :category_id, :integer
  end
end
