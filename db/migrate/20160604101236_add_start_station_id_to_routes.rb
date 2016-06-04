class AddStartStationIdToRoutes < ActiveRecord::Migration
  def change
    add_belongs_to :routes, :start_station
  end
end
