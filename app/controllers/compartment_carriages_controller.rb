class CompartmentCarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @compartment_carriages = CompartmentCarriage.all
  end

  def show
  end

  def new
    @compartment_carriage = CompartmentCarriage.new
  end

  def create
    @compartment_carriage = CompartmentCarriage.new(compartment_carriage_params)
    @compartment_carriage.save ? redirect_to(@compartment_carriage) : render(:new)
  end

  def edit
  end

  def update
    @compartment_carriage.update(compartment_carriage_params) ? redirect_to(@compartment_carriage) : render(:new)
  end

  def destroy
    @compartment_carriage.destroy
    redirect_to compartment_carriages_path
  end

  private

  def set_carriage
    @compartment_carriage = CompartmentCarriage.find(params[:id])
  end

  def compartment_carriage_params
    params.require(:compartment_carriage).permit(:train_id, :high_places, :low_places)
  end
end