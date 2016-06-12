class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :destroy]

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
    @train = Train.find(params[:train_id])
    @ticket = current_user.tickets.new(train: @train, start_station: @train.route.railway_stations.ordered.first,
                                       end_station: @train.route.railway_stations.ordered.last,
                                       fio: params[:ticket][:fio], document: params[:ticket][:document])
    @ticket.save ? redirect_to(@ticket) : render(:new)
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end