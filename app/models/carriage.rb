class Carriage < ActiveRecord::Base
  belongs_to :train

  validates :carriage_type, presence: true
  validates :carriage_type, inclusion: { in: %w(Compartment Second\ class) }
  validates :high_places, presence: true
  validates :low_places, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  private

  def set_number
    self.number = train.last_carriage_number + 1
  end
end
