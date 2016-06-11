class TicketsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tickets = current_user.tickets
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    current_user.fio = params[:fio]
    current_user.document = params[:document]
    @train = Train.find(params[:train_id])
    @ticket = current_user.tickets.new(train: @train, start_station:
        @train.route.railway_stations.ordered.first, end_station: @train.route.railway_stations.ordered.last)
    current_user.save && @ticket.save ? redirect_to(@ticket) : render(:new)
  end
end