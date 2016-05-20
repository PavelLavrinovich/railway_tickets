class Carriage < ActiveRecord::Base
  belongs_to :train

  validates :carriage_type, presence: true
  validates :carriage_type, inclusion: { in: %w(Compartment Second\ class) }
  validates :high_places, presence: true
  validates :low_places, presence: true
end
