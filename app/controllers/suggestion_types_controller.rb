class SuggestionTypesController < ApplicationController

    def index
    @types = SuggestionType.all
    render json: @types
  end

end
