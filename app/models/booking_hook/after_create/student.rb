module BookingHook
  module AfterCreate
    class Student
      include Backoffice::Costume,
              Backoffice::Certificate

      def after_booking(booking)
        costume_borrow booking
        certificate_prepare booking
      end
    end
  end
end