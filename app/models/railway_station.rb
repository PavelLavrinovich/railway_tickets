class RailwayStation < ActiveRecord::Base
  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes
  has_many :start_tickets, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :end_tickets, class_name: 'Ticket', foreign_key: :end_station_id

  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.number').uniq }

  def number(route)
    station_route(route).try(:number)
  end

  def update_number(route, number)
    station_route(route).try(:update, number: number)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
