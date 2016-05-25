class CompartmentCarriagesController < CarriagesController
  protected

  def carriage_default_params
    carriage_params(:compartment_carriage, :train_id, :high_places, :low_places)
  end

  def model
    CompartmentCarriage
  end
end