class CreateTrips < ActiveRecord::Migration[5.1]
	def change
		create_table :trips do |t|
			t.references :departure, index: true, foreign_key: { to_table: :points }
			t.references :arrival, index: true, foreign_key: { to_table: :points }
			t.integer :transport_mode
			t.datetime :date
			t.timestamps
		end
	end
end
