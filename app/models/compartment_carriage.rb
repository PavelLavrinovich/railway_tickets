class CompartmentCarriage < Carriage
  validates :low_places, presence: true
  validates :high_places, presence: true
end