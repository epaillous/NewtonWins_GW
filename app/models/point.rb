class Point < ApplicationRecord
	validates :latitude, :longitude, presence: true
	has_one :city

	def pretty_label
		"(#{latitude}, #{longitude})"
	end

end
