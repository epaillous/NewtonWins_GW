class MediaController < ApplicationController

  def index
    @medias = Medium.where(point: params[:point_id])
    render json: @medias
  end

end
