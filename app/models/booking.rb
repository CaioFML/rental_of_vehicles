class Booking < ApplicationRecord
  belongs_to :vehicle

  validates :cpf, :vehicle, :start_at, :end_at, presence: true
  validate :booking_period_conflict

  scope :booking_period, ->(start_at, end_at) { where("start_at >= ? AND end_at <= ?", start_at, end_at) }

  private

  def booking_period_conflict
    errors.add(:base, "Veículo já reservado neste período") if Booking.booking_period(start_at, end_at)
                                                                      .where(vehicle_id: vehicle_id)
                                                                      .exists?
  end
end
