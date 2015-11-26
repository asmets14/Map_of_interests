ActiveAdmin.register Category do
  permit_params :name, :published, :thumbnail

  index do
    selectable_column
    column :id
    column :name
    column   :thumbnail do |event|
      if event.thumbnail_file_name.blank?
        "No picture yet"
      else
        image_tag(event.thumbnail.url(:thumb))
      end
    end
    column :published
    actions
  end

  show do
    attributes_table do
      row :name
      row :thumbnail do |event|
        image_tag(event.thumbnail.url(:thumb))
      end
      row :published
    end
  end

  form do |f|
    inputs do
      input :name
      input :thumbnail, label: 'Thumbnail (35x35)'
      input :published
      submit
    end
  end

end

