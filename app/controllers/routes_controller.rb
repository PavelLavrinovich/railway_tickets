class RoutesController < ApplicationController
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
    @route.save ? redirect_to(@route) : render(:new)
  end

  def edit
  end

  def update
    @route.update(route_params) ? redirect_to(@route) : render(:edit)
  end

  def destroy
    @route.destroy
    redirect_to routes_path
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, railway_station_ids: [])
  end
end
