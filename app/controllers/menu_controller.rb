class MenuController < ApplicationController

  def index
    @menu_items = []
    continents = Continent.all
    continents.map do |continent|
      @menu_items << {name: continent.name, point: continent.point, picto_url: continent.picto_url}
    end
    render json: {menu: @menu_items}
  end

end
