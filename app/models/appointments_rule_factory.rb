class AppointmentsRuleFactory
  def self.create(booking)
    clown_contract = booking.clown.contract
    self.send(clown_contract)
  end

  private

  def self.student
    AppointmentsNumberRule.new 1
  end

  def self.parttime
    AppointmentsNumberRule.new 2
  end

  def self.fulltime
    AppointmentsNumberRule.new 3
  end
end