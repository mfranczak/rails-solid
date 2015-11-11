module BookingHook
  module AfterCreate
    class Parttime
      include Backoffice::Costume
      def after_booking(booking)
        costume_borrow booking
      end
    end
  end
end