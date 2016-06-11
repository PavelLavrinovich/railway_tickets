module Admin
  class TicketsController < BaseController
    before_action :set_ticket, only: [:show, :edit, :update, :destroy]

    def index
      @tickets = Ticket.all
    end

    def show
    end

    def new
      @ticket = current_user.tickets.new
    end

    def edit
    end

    def update
      @ticket.user.fio = params[:fio]
      @ticket.user.document = params[:document]
      @ticket.user.save ? redirect_to(@ticket) : render(:new)
    end

    def create
      current_user.fio = params[:fio]
      current_user.document = params[:document]
      @train = Train.find(params[:train_id])
      @ticket = current_user.tickets.new(train: @train, start_station: @train.route.railway_stations.ordered.first,
                                         end_station: @train.route.railway_stations.ordered.last)
      current_user.save && @ticket.save ? redirect_to(@ticket) : render(:new)
    end

    private

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
  end
end