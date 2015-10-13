ActiveAdmin.register Interest do
  permit_params :name, :category, :longitude, :latitude, :address

  form do |f|
    inputs do
      input :name
      input :category, as: :select, collection: Interest::CATEGORY, include_blank: false
      input :address
      input :longitude
      input :latitude
      submit
    end
  end
end
