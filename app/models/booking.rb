class Booking < ActiveRecord::Base

  APPOINTMENT_TIME = ['morning', 'afternoon', 'evening']

  belongs_to :clown

  validates :appointment_time, inclusion: { in: Booking::APPOINTMENT_TIME }
  validates :clown, presence: true
  validates :appointment_date, presence: true

  validate :number_of_appointments_per_day,
           :already_has_an_appointment

  private

  # Depending on the clowns contract they are not allowed to take more appointments than X a day.
  #
  # [SRP]: This business logic should not be placed in the Model class. Extract it to a validator class
  # http://guides.rubyonrails.org/active_record_validations.html#custom-validators
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
      errors.add :appointment_date, 'This clown can not have more appointments'
    end
  end

  # [SRP*] Can be moved to a separate validator class.
  def already_has_an_appointment
    if clown.has_appointment? appointment_date, appointment_time
      errors.add :appointment_time, 'This clown is already booked at this time'
    end
  end
end
