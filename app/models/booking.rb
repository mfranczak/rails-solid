class Booking < ActiveRecord::Base
  include ActiveModel::Validations

  APPOINTMENT_TIME = ['morning', 'afternoon', 'evening']

  belongs_to :clown

  validates :appointment_time, presence: true, inclusion: { in: Booking::APPOINTMENT_TIME }
  validates :clown, presence: true
  validates :appointment_date, presence: true

  validate :already_has_an_appointment,
           :booking_is_not_in_the_past

  validates_with BookingClownAppointmentsValidator

  after_create :after_create_hook

  private

  def after_create_hook
    BookingHook::Resolver.after_create_resolve(self).after_booking(self)
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
