class Route < ActiveRecord::Base
  has_many :railway_stations_routes, dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true

  after_validation :set_stations_numbers

  def start_station_leave_time
    railway_stations.ordered.first.try(:leave_time, self)
  end

  def end_station_arrive_time
    railway_stations.ordered.last.try(:arrive_time, self)
  end

  private

  def set_stations_numbers
    railway_stations_routes.each_with_index { |station_route, index| station_route.number = index + 1 }
  end
end
