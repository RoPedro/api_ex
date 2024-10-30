class ChampionsController < ApplicationController
  def index
    @champions = DataDragonService.champions
  end

  def show
    @champion = DataDragonService.champion_details(params[:id])
    if @champion
      render json: @champion
    else
      render json: { error: 'Champion not found' }, status: :not_found
    end
  end
end
