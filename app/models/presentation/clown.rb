class Presentation::Clown
  attr_accessor :last_booking

  def initialize(clown)
    @clown = clown

    unless clown.bookings.empty?
      self.last_booking = clown.bookings.last.created_at.strftime('%e.%-m.%Y')
    end
  end

  def method_missing(method_sym, *arguments, &block)
    if @clown.respond_to? method_sym
      @clown.send method_sym, *arguments, &block
    else
      super
    end
  end

  def respond_to_missing?(method_sym)
    @clown.respond_to? method_sym || super
  end
end
