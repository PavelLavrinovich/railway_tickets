module Admin
  class RailwayStationsController < BaseController
    before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_info]

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
      @railway_station.save ? redirect_to([:admin, @railway_station]) : render(:new)
    end

    def update
      @railway_station.update(railway_station_params) ? redirect_to([:admin, @railway_station]) : render(:edit)
    end

    def destroy
      @railway_station.destroy
      redirect_to admin_railway_stations_path
    end

    def update_info
      @route = Route.find(params[:route_id])
      @railway_station.update_info(@route, params[:number], params[:arrive_time], params[:leave_time])
      redirect_to [:admin, @route]
    end

    private

    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    def railway_station_params
      params.require(:railway_station).permit(:title)
    end
  end

end