class RailwayStation < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :start_tickets, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :end_tickets, class_name: 'Ticket', foreign_key: :end_station_id
end
