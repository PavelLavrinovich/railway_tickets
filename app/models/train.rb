class Train < ActiveRecord::Base
  belongs_to :route
  has_many :tickets
  has_many :carriages

  def count_carriages(type)
    carriages_with_type(type).size
  end

  def count_places(type, places_method)
    carriages_with_type(type).sum(places_method)
  end

  def last_carriage_number
    carriages.maximum(:number) || 0
  end

  private

  def carriages_with_type(type)
    carriages.where(type: type)
  end
end
