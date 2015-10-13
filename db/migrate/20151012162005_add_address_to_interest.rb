class AddAddressToInterest < ActiveRecord::Migration
  def change
    add_column :interests, :address, :string
  end
end
