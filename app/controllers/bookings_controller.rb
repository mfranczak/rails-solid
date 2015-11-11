class BookingsController < ApplicationController
  def create
    booking = Booking.new booking_params

    if booking.valid?
      booking.save
      flash[:success] = "#{booking.clown.name} is now booked for your party"
      redirect_to clown_path booking.clown
    else
      @clown = booking.clown
      @booking = booking

      flash[:danger] = 'Sorry! We could not book this clown for you. Please check the form below.'
      render 'clowns/show'
    end
  end

  private
  def booking_params
    params.fetch(:booking).permit(:clown_id, :appointment_date, :appointment_time)
  end
end
