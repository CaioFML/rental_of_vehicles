class VehiclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vehicle, only: %i[edit update destroy]
  before_action :set_brands, only: %i[new edit]

  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)

    redirect_to vehicles_path if @vehicle.save
  end

  def edit; end

  def update
    render :edit if @vehicle.update(vehicle_params)
  end

  def destroy
    redirect_to vehicles_path if @vehicle.destroy
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def set_brands
    @brands = Fipe::Request.brands.map { |brand| [brand["name"], brand["id"]] }
  end

  def vehicle_params
    params.require(:vehicle).permit(:brand, :model, :manufacture_year, :model_year, :plate)
  end
end
