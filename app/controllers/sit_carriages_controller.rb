class SitCarriagesController < CarriagesController
  protected

  def carriage_default_params
    carriage_params(:sit_carriage, :sit_places)
  end

  def model
    SitCarriage
  end
end