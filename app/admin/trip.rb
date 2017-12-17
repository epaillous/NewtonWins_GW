ActiveAdmin.register Trip do
	permit_params :transport_mode, :departure_id, :arrival_id, :date

	form do |f|
		f.inputs do
			f.input :transport_mode
      f.input :departure_id, label: 'Departure', as: :select, collection: City.all.map{|c| ["#{c.name}", c.point.id]}
      f.input :arrival_id, label: 'Arrival', as: :select, collection: City.all.map{|c| ["#{c.name}", c.point.id]}
      f.input :date
    end
    f.actions
  end

  show do
    attributes_table do
      row :date
      row :transport_mode
      row :departure do |trip|
        trip.departure.city
      end
      row :arrival do |trip|
        trip.arrival.city
      end
    end
  end

  index do
    selectable_column
    id_column
    column :date
    column :transport_mode
    column :departure do |trip|
      trip.departure.city
    end
    column :arrival do |trip|
      trip.arrival.city
    end
    actions
  end

end
