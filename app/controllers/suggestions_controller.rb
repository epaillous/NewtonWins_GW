class SuggestionsController < ApplicationController

  def create
    @suggestion = Suggestion.new(permitted_params)
    if !@suggestion.save
      render json: {error: @suggestion.error}, status: :unprocessable_entity
    else
      render json: @suggestion
    end

  end

private
  def permitted_params
    params.require(:suggestion).permit(:name, :comment, :suggestion_type_id, :address,
      point_attributes: [:id, :latitude, :longitude])
  end

end
