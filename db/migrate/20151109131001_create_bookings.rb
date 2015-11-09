class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :appointment_date
      t.string :appointment_time
      t.references :clown, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
