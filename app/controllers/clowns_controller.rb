class ClownsController < ApplicationController
  def index
    @clowns = Clown.all
  end

  def show
    begin
      @clown = Clown.find params[:id]
      @booking = Booking.new clown: @clown
    rescue ActiveRecord::RecordNotFound
      flash[:warning] = 'Clown was not found'
      redirect_to clowns_path
    end
  end
end