class Train < ActiveRecord::Base
  belongs_to :route
  has_many :tickets
  has_many :carriages

  def count_carriages(type)
    carriages_with_type(type).size
  end

  def count_places(type, places_method)
    carriages_with_type(type).inject(0) { |total, carriage| total + carriage.send(places_method) }
  end

  def last_carriage_number
    carriages.size
  end

  private

  def carriages_with_type(type)
    carriages.where(type: type)
  end
end
