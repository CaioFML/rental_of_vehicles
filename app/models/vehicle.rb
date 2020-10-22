class Vehicle < ApplicationRecord
  attr_accessor :brand_id

  validates :brand, :model, :model_year, :plate, :manufacture_year, presence: true

  def full_name
    "#{brand} - #{model} - #{model_year}"
  end
end
