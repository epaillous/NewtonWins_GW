ActiveAdmin.register Continent do
  permit_params :name, :picto_url, point_attributes: [:id, :latitude, :longitude]

  form do |f|
    f.inputs "General" do
     f.input :name
     f.input :picto_url
   end
   f.inputs "Coordinates", for: [:point, continent.point || Point.new] do |p|
    p.input :latitude
    p.input :longitude
  end
  f.actions
end

show do
  attributes_table do
    row :name
    row :picto_url
    row :point do continent
      continent.point.pretty_label
    end
  end
end

index do
  selectable_column
  id_column
  column :name
  column :point do |continent|
    continent.point.pretty_label
  end
  actions
end

end
