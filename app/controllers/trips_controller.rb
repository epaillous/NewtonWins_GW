class TripsController < ApplicationController

	def index
		@trips = Trip.all.order('date DESC')
		render json: @trips, root: 'trips'
	end
end
