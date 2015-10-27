class AddWebsiteToInterests < ActiveRecord::Migration
  def change
    add_column :interests, :website, :string
  end
end
