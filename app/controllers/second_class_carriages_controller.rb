class SecondClassCarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @second_class_carriages = SecondClassCarriage.all
  end

  def show
  end

  def new
    @second_class_carriage = SecondClassCarriage.new
  end

  def create
    @second_class_carriage = SecondClassCarriage.new(second_class_carriage_params)
    @second_class_carriage.save ? redirect_to(@second_class_carriage) : render(:new)
  end

  def edit
  end

  def update
    @second_class_carriage.update(second_class_carriage_params) ? redirect_to(@second_class_carriage) : render(:new)
  end

  def destroy
    @second_class_carriage.destroy
    redirect_to second_class_carriages_path
  end

  private

  def set_carriage
    @second_class_carriage = SecondClassCarriage.find(params[:id])
  end

  def second_class_carriage_params
    params.require(:second_class_carriage).permit(
        :train_id, :high_places, :low_places, :side_high_places, :side_low_places
    )
  end
end