class SvCarriagesController < CarriagesController
  protected

  def carriage_default_params
    carriage_params(:sv_carriage, :train_id, :low_places)
  end

  def model
    SvCarriage
  end
end