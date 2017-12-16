class Country < ApplicationRecord
	belongs_to :point
	belongs_to :continent
	accepts_nested_attributes_for :point
	validates :point, :continent, :name, presence: true
end
