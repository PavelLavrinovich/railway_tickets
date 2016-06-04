class AddEndStationIdToRoutes < ActiveRecord::Migration
  def change
    add_belongs_to :routes, :end_station
  end
end
