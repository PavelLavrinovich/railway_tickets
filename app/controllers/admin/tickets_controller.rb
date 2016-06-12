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
      @ticket.update(ticket_params) ? redirect_to([:admin, @ticket]) : render(:new)
    end

    def destroy
      @ticket.destroy
      redirect_to admin_tickets_path
    end

    private

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:fio, :document)
    end
  end
end