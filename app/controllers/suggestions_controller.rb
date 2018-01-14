class SuggestionsController < AuthenticatedController


  def index
    @suggestions = Suggestion.where(user_id: current_user.id)
    render json: @suggestions
  end

  def create
    @suggestion = Suggestion.new(permitted_params)
    @suggestion.user = current_user
    if !@suggestion.save
      render json: {error: @suggestion.errors}, status: :unprocessable_entity
    else
      render json: @suggestion
    end
  end

  def update
    @suggestion = Suggestion.find(params[:id])
    if !@suggestion.update(permitted_params)
      render json: {error: @suggestion.errors}, status: :unprocessable_entity
    else
      render json: @suggestion
    end
  end

  def destroy
    Suggestion.find(params[:id]).destroy
    render json: {}, status: :ok
  end

private
  def permitted_params
    params.require(:suggestion).permit(:name, :comment, :suggestion_type_id, :address,
      :user_id, point_attributes: [:id, :latitude, :longitude])
  end

end
