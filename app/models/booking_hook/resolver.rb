class BookingHook::Resolver
  def self.after_create_resolve(booking)
    klass = 'BookingHook::AfterCreate::' + booking.clown.contract.to_s.capitalize
    klass.constantize.new
  end
end