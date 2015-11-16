class Booking < ActiveRecord::Base
  include ActiveModel::Validations

  APPOINTMENT_TIME = ['morning', 'afternoon', 'evening']

  belongs_to :clown

  validates :appointment_time, presence: true, inclusion: { in: Booking::APPOINTMENT_TIME }
  validates :clown, presence: true
  validates :appointment_date, presence: true

  validate :already_has_an_appointment,
           :booking_is_not_in_the_past

  # The Booking model is configured to use BookingClownAppointmentsValidator as a validator
  # instead of the number_of_appointments_per_day method.
  validates_with BookingClownAppointmentsValidator

  private

  # Depending on the clowns contract they are not allowed to take more appointments than X a day.
  #
  # [SRP]: This business logic should not be placed in the Model class. Extract it to a validator class
  # BookingClownAppointmentsValidator and configure the model.
  # More info: http://guides.rubyonrails.org/active_record_validations.html#custom-validators
  def number_of_appointments_per_day
    appointment_day = Booking.where(clown: clown, appointment_date: appointment_date).count

    max_per_day = 0

    # [OCP]: This switch is a smell for Open/Closed principle violation.
    # Adding new rule should not require changing the validator
    case clown.contract.to_sym
      when :fulltime
        max_per_day = 3
      when :parttime
        max_per_day = 2
      when :student
        max_per_day = 1
    end

    if appointment_day >= max_per_day
      errors.add :appointment_date, 'This clown can not have more appointments. Try to change the date.'
    end
  end

  # [SRP*] Can be moved to a separate validator class.
  def already_has_an_appointment
    if clown.has_appointment? appointment_date, appointment_time
      errors.add :appointment_time, 'This clown is already booked at this time'
    end
  end

  def booking_is_not_in_the_past
    valid = !appointment_date.nil?
    valid = valid && appointment_date >= Date.today

    unless valid
      errors.add :appointment_date, 'You can not book a clown for the past'
    end
  end
end
