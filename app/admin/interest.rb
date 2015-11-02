ActiveAdmin.register Interest do
  permit_params :name, :category, :longitude, :latitude, :address, :thumbnail, :phone, :website, :tag_list, :published

  batch_action :published do |id|
    Interest.find(id).each do |e|
      e.published =  true
      e.save
    end
    redirect_to collection_path, notice: "All elements are published"
  end

  batch_action :unpublished do |id|
    Interest.find(id).each do |e|
      e.published =  false
      e.save
    end
    redirect_to collection_path, notice: "All elements are unpublished"
  end

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
    column :published
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
      row :published
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
      input :published
      submit
    end
  end
end
