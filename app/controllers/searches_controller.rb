class SearchesController < ApplicationController
  def show
    @routes = []
  end

  def search
    start_station = RailwayStation.find(params[:start_station_id])
    end_station = RailwayStation.find(params[:end_station_id])
    @routes = start_station.search_routes_to(end_station)
    render :show
  end
end