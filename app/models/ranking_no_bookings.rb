class RankingNoBookings < Ranking
  def initialize(clown)
    super()
    self.points = 10 if clown.is_student?
  end
end