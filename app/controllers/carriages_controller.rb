class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = model.all
  end

  def show
  end

  def new
    @carriage = model.new
  end

  def create
    @carriage = model.new(carriage_default_params)
    @carriage.save ? redirect_to(@carriage) : render(:new)
  end

  def edit
  end

  def update
    @carriage.update(carriage_default_params) ? redirect_to(@carriage) : render(:new)
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_path
  end

  protected

  def set_carriage
    @carriage = model.find(params[:id])
  end

  def carriage_params(name, *args)
    params.require(name).permit(args)
  end

  def carriage_default_params
    carriage_params(:carriage, :train_id, :high_places, :low_places, :side_high_places, :side_low_places, :sit_places)
  end

  def model
    Carriage
  end
end