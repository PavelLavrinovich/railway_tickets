module Admin
  class CarriagesController < BaseController
    before_action :set_carriage, only: [:show, :edit, :update, :destroy]
    before_action :set_train, only: [:new, :create]

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
      @carriage.train = @train
      @carriage.save ? redirect_to([:admin, @carriage]) : render(:new)
    end

    def edit
    end

    def update
      @carriage.update(carriage_default_params) ? redirect_to([:admin, @carriage]) : render(:new)
    end

    def destroy
      @carriage.destroy
      redirect_to [:admin, @carriage.train]
    end

    protected

    def set_carriage
      @carriage = model.find(params[:id])
    end

    def set_train
      @train = Train.find(params[:train_id])
    end

    def carriage_params(name, *args)
      params.require(name).permit(args)
    end

    def carriage_default_params
      carriage_params(:carriage, :high_places, :low_places, :side_high_places, :side_low_places, :sit_places)
    end

    def model
      Carriage
    end
  end
end
