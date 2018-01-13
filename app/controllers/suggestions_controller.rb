class SuggestionsController < AuthenticatedController

  def create
    @suggestion = Suggestion.new(permitted_params)
    @suggestion.user = current_user
    if !@suggestion.save
      render json: {error: @suggestion.errors}, status: :unprocessable_entity
    else
      render json: @suggestion
    end

  end

private
  def permitted_params
    params.require(:suggestion).permit(:name, :comment, :suggestion_type_id, :address,
      :user_id, point_attributes: [:id, :latitude, :longitude])
  end

end
