class BookingClownAppointmentsValidator < ActiveModel::Validator
  def validate(booking)
    appointment_day = Booking.where(clown: booking.clown, appointment_date: booking.appointment_date).count

    max_per_day = 0

    # [OCP]: This switch is a smell for Open/Closed principle violation.
    # Adding new rule should not require changing the validator
    case booking.clown.contract.to_sym
      when :fulltime
        max_per_day = 3
      when :parttime
        max_per_day = 2
      when :student
        max_per_day = 1
    end

    if appointment_day >= max_per_day
      booking.errors.add :appointment_date, 'This clown can not have more appointments. Try to change the date.'
    end

  end
end