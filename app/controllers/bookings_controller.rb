class BookingsController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    redirect_to root_path, notice: "Reserva realizada com sucesso." if @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:vehicle_id, :cpf, :start_at, :end_at)
  end
end
