class AddLeaveTimeToRailwayStationsRoutes < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :leave_time, :time
  end
end
