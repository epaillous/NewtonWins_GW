class Point < ApplicationRecord
	validates :latitude, :longitude, presence: true

	def pretty_label
		"(#{latitude}, #{longitude})"
	end
end
