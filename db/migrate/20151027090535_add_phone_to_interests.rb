class AddPhoneToInterests < ActiveRecord::Migration
  def change
    add_column :interests, :phone, :string
  end
end
