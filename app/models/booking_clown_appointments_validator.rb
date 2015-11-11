class BookingClownAppointmentsValidator < ActiveModel::Validator
  def validate(booking)
    if AppointmentsRuleFactory.create(booking).applies?(booking)
      booking.errors.add :appointment_date, 'This clown can not have more appointments. Try to change the date.'
    end
  end
end