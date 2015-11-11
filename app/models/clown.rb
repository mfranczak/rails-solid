class Clown < ActiveRecord::Base
  include RankingData

  CONTRACTS = [:fulltime, :parttime, :student]

  has_many :bookings

  validates :name, presence: true
  validates :contract, presence: true

  def has_appointment?(date, time)
    Booking.where(appointment_date: date, appointment_time: time, clown: self).count > 0
  end

  # [LSP] This method is not a correct substitute for RankingData module.
  # RankingData#ranking_data returns Ranking object when bookings.empty? method returns false which is Boolean
  # Therefore a condition was implemented in the views
  #
  # Change this method to be a proper substitute for RankingData#ranking_data
  #   - Use NullObject pattern when bookings are empty: rules, if a clown is a student he has 10 points
  #   - Remove the condition from views: clowns/show.html.erb
  def ranking_data
    if bookings.empty?
      RankingNoBookings.new self
    else
      super
    end
  end

  # Duplicate code:
  # Use method missing or class eval to apply meta programming
  # ----------------------------------------------------------
  # self.instance_eval do
  #   Clown::CONTRACTS.each do |available_contract|
  #     method_name = "is_#{available_contract}?"
  #     define_method method_name.to_sym do
  #       contract.to_sym == available_contract
  #     end
  #   end
  # end

  def is_student?
    contract.to_sym == :student
  end

  def is_fulltime?
    contract.to_sym == :fulltime
  end

  def is_parttime?
    contract.to_sym == :parttime
  end
end
