ActiveAdmin.register City do
	permit_params :name, :country_id, point_attributes: [:id, :latitude, :longitude]

	form do |f|
		f.inputs "General" do
			f.input :name
			f.input :country
		end
		f.inputs "Coordinates", for: [:point, city.point || Point.new] do |p|
			p.input :latitude
			p.input :longitude
		end
		f.actions
	end

	show do
		attributes_table do
			row :name
			row :country
			row :point do city
				city.point.pretty_label
			end
		end
	end

	index do
		selectable_column
		id_column
		column :name
		column :country
		column :point do |city|
			city.point.pretty_label
		end
		actions
	end

end
