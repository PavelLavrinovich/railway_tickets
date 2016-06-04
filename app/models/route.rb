class Route < ActiveRecord::Base
  has_many :railway_stations_routes, dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  validates :name, presence: true

  after_validation :set_stations_numbers

  def update_info
    min_number = railway_stations_routes.minimum(:number)
    max_number = railway_stations_routes.maximum(:number)
    self.start_station = railway_stations_routes.find_by(number: min_number).try(:railway_station)
    self.end_station = railway_stations_routes.find_by(number: max_number).try(:railway_station)
    save
  end

  def start_station_leave_time
    railway_stations_routes.find_by(railway_station: start_station).try(:leave_time)
  end

  def end_station_arrive_time
    railway_stations_routes.find_by(railway_station: end_station).try(:arrive_time)
  end

  private

  def set_stations_numbers
    railway_stations_routes.each_with_index { |station_route, index| station_route.number = index + 1 }
  end
end
