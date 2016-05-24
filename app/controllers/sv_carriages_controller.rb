class SvCarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @sv_carriages = SvCarriage.all
  end

  def show
  end

  def new
    @sv_carriage = SvCarriage.new
  end

  def create
    @sv_carriage = SvCarriage.new(sv_carriage_params)
    @sv_carriage.save ? redirect_to(@sv_carriage) : render(:new)
  end

  def edit
  end

  def update
    @sv_carriage.update(sv_carriage_params) ? redirect_to(@sv_carriage) : render(:new)
  end

  def destroy
    @sv_carriage.destroy
    redirect_to sv_carriages_path
  end

  private

  def set_carriage
    @sv_carriage = SvCarriage.find(params[:id])
  end

  def sv_carriage_params
    params.require(:sv_carriage).permit(:train_id, :low_places)
  end
end