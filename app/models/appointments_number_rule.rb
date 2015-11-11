class AppointmentsNumberRule
  def initialize(max_number)
  end

  # This rule applies when the number of bookings on the same day as new booking is >= to max_number
  def applies?(booking)
  end
end