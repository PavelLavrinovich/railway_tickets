module Admin
  class SecondClassCarriagesController < CarriagesController
    protected

    def carriage_default_params
      carriage_params(:second_class_carriage, :high_places, :low_places, :side_high_places, :side_low_places)
    end

    def model
      SecondClassCarriage
    end
  end
end