class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = Carriage.new(carriage_params)
    @carriage.save ? redirect_to(@carriage) : render(:new)
  end

  def edit
  end

  def update
    @carriage.update(carriage_params) ? redirect_to(@carriage) : render(:new)
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_path
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:train_id, :carriage_type, :high_places, :low_places)
  end
end