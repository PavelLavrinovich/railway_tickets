class AddArriveTimeToRailwayStationsRoutes < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :arrive_time, :time
  end
end
