class SearchesController < ApplicationController
  def show
    @routes = []
  end

  def search
    @routes = Route.where(start_station_id: params[:start_station_id], end_station_id: params[:end_station_id])
    render :show
  end
end