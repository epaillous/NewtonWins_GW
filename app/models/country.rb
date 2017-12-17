class Country < ApplicationRecord
	belongs_to :point, dependent: :destroy
	belongs_to :continent
	accepts_nested_attributes_for :point
	validates :point, :continent, :name, presence: true
	has_many :cities, dependent: :destroy
end
