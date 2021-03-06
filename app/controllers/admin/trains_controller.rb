module Admin
  class TrainsController < BaseController
    before_action :set_train, only: [:show, :edit, :update, :destroy]
    before_action :set_routes, only: [:new, :edit, :index]

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
      @train.save ? redirect_to([:admin, @train]) : render(:new)
    end

    def update
      @train.update(train_params) ? redirect_to(admin_trains_path) : render(:edit)
    end

    def destroy
      @train.destroy
      redirect_to admin_trains_path
    end

    private

    def set_routes
      @routes = Route.all
    end

    def set_train
      @train = Train.find(params[:id])
    end

    def train_params
      params.require(:train).permit(:number, :route_id, :is_head)
    end
  end
end