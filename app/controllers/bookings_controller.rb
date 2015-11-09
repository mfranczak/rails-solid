class BookingsController < ApplicationController
  def create
    booking = Booking.new booking_params

    if booking.valid?
      booking.save
      redirect_to clown_path booking.clown
    else
      redirect_to root_path
    end
  end

  private
  def booking_params
    params.fetch(:booking).permit(:clown_id, :appointment_date, :appointment_time)
  end
end
