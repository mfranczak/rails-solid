module Backoffice::Costume
  include Backoffice::Base

  # this method sends a request to borrow a costume for the clown
  def costume_borrow(booking)
    call_api :costume_borrow, booking
  end

  # informs that costume was returned
  def costume_return(booking)
    call_api :costume_return, booking
  end

  # informs that costume was returned
  def costume_mark_as_broken(booking)
    call_api :costume_mark_as_broken, booking
  end
end