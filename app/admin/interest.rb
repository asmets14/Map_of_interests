ActiveAdmin.register Interest do
  permit_params :name, :category, :longitude, :latitude, :address, :thumbnail, :phone, :website, :tag_list

  index do
    selectable_column
    column :id
    column :name
    column :address
    column :phone
    column :website
    column   :thumbnail do |event|
      if event.thumbnail_file_name.blank?
        "No picture yet"
      else
        image_tag(event.thumbnail.url(:thumb))
      end
    end
    column :category
    column :tag_list
    actions
  end

  show do
    attributes_table do
      row :name
      row :address
      row :phone
      row :website
      row :latitude
      row :longitude
      row :tag_list
      row :thumbnail do |event|
        image_tag(event.thumbnail.url(:thumb))
      end
    end
  end

  form do |f|
    inputs do
      input :name
      input :address
      input :category, as: :select, collection: Interest::CATEGORY, include_blank: false
      input :phone
      input :website
      input :thumbnail
      input :tag_list
      submit
    end
  end
end
