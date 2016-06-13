class SearchesController < ApplicationController
  before_action :set_stations
  def show
    @routes = []
  end

  def search
    start_station = RailwayStation.find(params[:start_station_id])
    end_station = RailwayStation.find(params[:end_station_id])
    @routes = start_station.search_routes_to(end_station)
    render :show
  end

  private

  def set_stations
    @stations = RailwayStation.all
  end
end