class SitCarriagesController < CarriagesController
  protected

  def carriage_default_params
    carriage_params(:sit_carriage, :train_id, :sit_places)
  end

  def model
    SitCarriage
  end
end