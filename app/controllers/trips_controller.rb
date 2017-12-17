class TripsController < ApplicationController

	def index
		@trips = Trip.all
		render json: @trips, root: 'trips'
	end
end
