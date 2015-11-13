class BookingHook::AfterCreate::Parttime
  include Backoffice::Costume

  def after_booking(booking)
    costume_borrow booking
  end
end