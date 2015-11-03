ActiveAdmin.register User do
  permit_params :email, :last_sign_in_at

  index do
    selectable_column
    column :id
    column :email
    column :last_sign_in_at
    actions
  end
end
