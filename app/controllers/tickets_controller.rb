class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @user = User.new(fio: params[:fio], document: params[:document])
    if @user.save
      @train = Train.find(params[:train_id])
      @ticket = Ticket.create(
          user: @user, train: @train, start_station: @train.route.start_station, end_station: @train.route.end_station
      )
      redirect_to @ticket
    else
      render :new
    end
  end

  private

  def ticket_params

  end

  def user_params

  end
end