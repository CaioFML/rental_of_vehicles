class Booking < ApplicationRecord
  belongs_to :vehicle

  validates :cpf, :vehicle, :start_at, :end_at, presence: true

  scope :booking_period, ->(start_at, end_at) { where("start_at >= ? AND end_at <= ?", start_at, end_at) }
end
