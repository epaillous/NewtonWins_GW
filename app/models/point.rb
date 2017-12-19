class Point < ApplicationRecord
	validates :latitude, :longitude, presence: true
	has_one :city
  has_many :articles

	def pretty_label
		"(#{latitude}, #{longitude})"
	end

end
