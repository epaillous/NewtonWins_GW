class TripsController < ApplicationController

	def index
		@trips = Trip.all.order('date DESC')
		render json: @trips, include: ['departure', 'arrival', 'departure.articles',
     'arrival.articles', 'departure.city', 'arrival.city', 'departure.city.country', 'arrival.city.country']
	end
end
