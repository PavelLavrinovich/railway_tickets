module Admin
  class RoutesController < BaseController
    before_action :set_route, only: [:show, :edit, :update, :destroy]

    def index
      @routes = Route.all
    end

    def show
    end

    def new
      @route = Route.new
    end

    def create
      @route = Route.new(route_params)
      @route.save ? redirect_to([:admin, @route]) : render(:new)
    end

    def edit
    end

    def update
      @route.update(route_params) ? redirect_to([:admin, @route]) : render(:edit)
    end

    def destroy
      @route.destroy
      redirect_to admin_routes_path
    end

    private

    def set_route
      @route = Route.find(params[:id])
    end

    def route_params
      params.require(:route).permit(:name, railway_station_ids: [])
    end
  end

end