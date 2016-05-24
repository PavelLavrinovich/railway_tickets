class SitCarriage < Carriage
  validates :sit_places, presence: true
end