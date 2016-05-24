class CarriagesController < ApplicationController
  def index
    @carriages = Carriage.all
  end
end