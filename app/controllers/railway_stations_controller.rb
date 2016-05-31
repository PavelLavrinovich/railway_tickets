class RailwayStationsController < ApplicationController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_number]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)
    @railway_station.save ? redirect_to(@railway_station) : render(:new)
  end

  def update
    @railway_station.update(railway_station_params) ? redirect_to(@railway_station) : render(:edit)
  end

  def destroy
    @railway_station.destroy
    redirect_to railway_stations_path
  end

  def update_number
    @route = Route.find(params[:route_id])
    @railway_station.update_number(@route, params[:number])
    redirect_to @route
  end

  private

  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  def railway_station_params
    params.require(:railway_station).permit(:title)
  end
end
