class BookingsController < ApplicationController
  include Backoffice

  def create
    booking = Booking.new booking_params

    if booking.valid?
      booking.save

      # [DIP] Instead of using a case here we can inject a strategy determined by the type of contract
      # To fix:
      #   - use the ActiveRecord after_save hook:
      #   - create classes AfterBooking#{@clown.contract} which respond to #after_save(booking) and wraps the algorithm
      #   - each AfterBooking#{@clown.contract} should include the min. amount of methods
      case booking.clown.contract.to_sym
        when :student
          costume_borrow booking
          certificate_prepare booking
        when :parttime
          costume_borrow booking
      end

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
