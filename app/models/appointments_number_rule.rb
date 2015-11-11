class AppointmentsNumberRule
  def initialize(max_number)
    @max_number = max_number
  end

  def applies?(booking)
    appointment_day_count = Booking.where(clown: booking.clown, appointment_date: booking.appointment_date).count
    appointment_day_count >= @max_number
  end
end