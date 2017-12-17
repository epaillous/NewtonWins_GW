class Trip < ApplicationRecord
	enum transport_mode: [ :car, :plane, :bus, :train, :cycling, :hiking, :boat, :hitch_hiking, :motorbike ]
	belongs_to :departure, class_name: "Point"
	belongs_to :arrival, class_name: "Point"
	validates :departure, :arrival, :date, presence: true
end
