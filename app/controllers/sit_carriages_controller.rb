class SitCarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @sit_carriages = SitCarriage.all
  end

  def show
  end

  def new
    @sit_carriage = SitCarriage.new
  end

  def create
    @sit_carriage = SitCarriage.new(sit_carriage_params)
    @sit_carriage.save ? redirect_to(@sit_carriage) : render(:new)
  end

  def edit
  end

  def update
    @sit_carriage.update(sit_carriage_params) ? redirect_to(@sit_carriage) : render(:new)
  end

  def destroy
    @sit_carriage.destroy
    redirect_to sit_carriages_path
  end

  private

  def set_carriage
    @sit_carriage = SitCarriage.find(params[:id])
  end

  def sit_carriage_params
    params.require(:sit_carriage).permit(:train_id, :sit_places)
  end
end