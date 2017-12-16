class Continent < ApplicationRecord
	belongs_to :point
  accepts_nested_attributes_for :point
  validates :point, :name, presence: true
end
