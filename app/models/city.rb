class City < ApplicationRecord
	belongs_to :point
	belongs_to :country
	accepts_nested_attributes_for :point
	validates :name, :country, :point, presence: true
end
