class Carriage < ActiveRecord::Base
  belongs_to :train

  validates :type, presence: true
  validates :type, inclusion: { in: %w(CompartmentCarriage SecondClassCarriage SvCarriage SitCarriage) }
  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  private

  def set_number
    self.number = train.last_carriage_number + 1
  end
end
