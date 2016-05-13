class AddEndStationIdToTickets < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :end_station
  end
end
