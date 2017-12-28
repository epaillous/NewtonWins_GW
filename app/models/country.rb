class Country < ApplicationRecord
	belongs_to :point, dependent: :destroy
	belongs_to :continent
	accepts_nested_attributes_for :point
	validates :point, :continent, :name, presence: true
	has_many :cities, dependent: :destroy
  validates_length_of :code, is: 2, allow_blank: false
end
