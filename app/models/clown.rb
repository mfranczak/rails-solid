class Clown < ActiveRecord::Base
  include RankingData

  CONTRACTS = [:fulltime, :parttime, :student]

  has_many :bookings

  validates :name, presence: true
  validates :contract, presence: true

  def has_appointment?(date, time)
    Booking.where(appointment_date: date, appointment_time: time, clown: self).count > 0
  end

  def last_booking
    bookings.last.created_at
  end

  # [LSP] This method is not a correct substitute for RankingData module.
  # RankingData#ranking_data returns Ranking object when bookings.empty? method returns false which is Boolean
  # Therefore a condition was implemented in the views
  #
  # Change this method to be a proper substitute for RankingData#ranking_data
  #   - Use NullObject pattern when bookings are empty: rules, if a clown is a student he has 10 points
  #   - Remove the condition from views: clowns/show.html.erb
  def ranking_data
    super unless bookings.empty?
  end
end
