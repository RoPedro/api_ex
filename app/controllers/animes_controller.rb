class AnimesController < ApplicationController
  def index
  end

  def show
    @anime = JinkanService.anime_details(params[:id])
    if @anime
      render json: @anime
    else
      render json: { error: 'Anime not found' }, status: :not_found
    end
  end
end
