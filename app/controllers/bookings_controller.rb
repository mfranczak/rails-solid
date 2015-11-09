class BookingsController < ApplicationController
  def create
    booking = Booking.new booking_params

    if booking.valid?
      booking.save
      redirect_to clown_path booking.clown
    else
      @clown = booking.clown
      @booking = booking
      render 'clowns/show'
    end
  end

  private
  def booking_params
    params.fetch(:booking).permit(:clown_id, :appointment_date, :appointment_time)
  end
end
