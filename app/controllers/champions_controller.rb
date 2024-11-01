class ChampionsController < ApplicationController
  def index
    @champions = DataDragonService.champions
  end

  def show
    @champion = DataDragonService.champion_details(params[:id])
    if @champion
      Rails.logger.debug("Success retrieving champion")
    else
      Rails.logger.debug("Failed retrieving champion")
    end
  end
end
