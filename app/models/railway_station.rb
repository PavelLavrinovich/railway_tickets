class RailwayStation < ActiveRecord::Base
  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes
  has_many :start_tickets, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :end_tickets, class_name: 'Ticket', foreign_key: :end_station_id

  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.number').uniq }

  def number(route)
    station_route(route).try(:number)
  end

  def arrive_time(route)
    station_route(route).try(:arrive_time)
  end

  def leave_time(route)
    station_route(route).try(:leave_time)
  end

  def update_info(route, number, arrive_time, leave_time)
    station_route(route).try(:update, number: number, arrive_time: arrive_time, leave_time: leave_time)
  end

  def search_routes_to(another_station)
    routes & another_station.routes
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
