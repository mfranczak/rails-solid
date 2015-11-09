class Clown < ActiveRecord::Base
  has_many :bookings

  def has_appointment?(date, time)
    Booking.where(appointment_date: date, appointment_time: time, clown: self).count > 0
  end
end
