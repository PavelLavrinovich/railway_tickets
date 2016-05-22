class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }
  validates :number, uniqueness: { scope: :route_id }

  scope :ordered, -> { order(:number) }
end
