class CreatePoints < ActiveRecord::Migration[5.1]
	def change
		create_table :points do |t|
			t.string  :name
			t.decimal :latitude
			t.decimal :longitude
			t.timestamps
		end

		add_reference :continents, :point, foreign_key: true
	end
end
