class TrainsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @trains = Train.all
  end

  def show
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.new(train_params)
    @train.save ? redirect_to(@train) : render(:new)
  end

  def update
    @train.update(train_params) ? redirect_to(@train) : render(:edit)
  end

  def destroy
    @train.destroy
    redirect_to trains_path
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number)
  end
end
