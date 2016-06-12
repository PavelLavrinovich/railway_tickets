module Admin
  class SvCarriagesController < CarriagesController
    protected

    def carriage_default_params
      carriage_params(:sv_carriage, :low_places)
    end

    def model
      SvCarriage
    end
  end
end