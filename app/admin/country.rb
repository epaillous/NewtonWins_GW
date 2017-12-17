ActiveAdmin.register Country do
	permit_params :name, :continent_id, point_attributes: [:id, :latitude, :longitude]

	form do |f|
		f.inputs "General" do
			f.input :name
			f.input :continent, include_blank: false
		end
		f.inputs "Coordinates", for: [:point, country.point || Point.new] do |p|
			p.input :latitude
			p.input :longitude
		end
		f.actions
	end

	show do
		attributes_table do
			row :name
      row :continent
      row :point do country
        country.point.pretty_label
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :continent
    column :point do |country|
     country.point.pretty_label
   end
   actions
 end

end
