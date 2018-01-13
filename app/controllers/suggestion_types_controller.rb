class SuggestionTypesController < AuthenticatedController

    def index
    @types = SuggestionType.all
    render json: @types
  end

end
