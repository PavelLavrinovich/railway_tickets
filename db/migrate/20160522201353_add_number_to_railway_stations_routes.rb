class AddNumberToRailwayStationsRoutes < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :number, :integer
  end
end
