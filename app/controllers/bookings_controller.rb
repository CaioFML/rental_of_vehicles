class BookingsController < ApplicationController
  layout "layouts/admin", only: :index

  before_action :authenticate_user!, only: :index

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to root_path, notice: "Reserva realizada com sucesso."
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:vehicle_id, :cpf, :start_at, :end_at)
  end
end
