class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :cpf
      t.date :start_at
      t.date :end_at
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
