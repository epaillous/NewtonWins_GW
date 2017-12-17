class Continent < ApplicationRecord
	belongs_to :point, dependent: :destroy
  accepts_nested_attributes_for :point
  validates :point, :name, presence: true
  has_many :countries, dependent: :destroy
end
