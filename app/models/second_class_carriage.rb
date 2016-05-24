class SecondClassCarriage < Carriage
  validates :low_places, presence: true
  validates :high_places, presence: true
  validates :side_high_places, presence: true
  validates :side_low_places, presence: true
end