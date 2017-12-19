ActiveAdmin.register Article do
  permit_params :title, :subtitle, :main_image_url, :point_id, :content, :published, :date

  form do |f|
    f.inputs "General" do
     f.input :title
     f.input :subtitle
     f.input :main_image_url
     f.input :published
     f.input :date
     f.input :point, label: 'Point', as: :select, collection: City.all.map{|c| ["#{c.name}", c.point.id]}
   end
   f.inputs "Content" do
    f.input :content, as: :html_editor
  end
  f.actions
end

  show do
    attributes_table do
      row :title
      row :subtitle
      row :published
      row :date
      row :image do |article|
        image_tag article.main_image_url
      end
      row :point do |article|
        article.point.pretty_label
      end
      row :content do |article|
        raw(article.content)
      end
    end
  end

  index do
    selectable_column
    id_column
    column :title
    column :date
    column :published
    column :point do |article|
      article.point.pretty_label
    end
    actions
  end
end
