module RankingData
  def ranking_data
    self.send(self.class.to_s.downcase.to_sym, self)
  end

  private
  def clown(clown_obj)
    rank = Ranking.new
    rank.bookings = clown_obj.bookings.count
    rank.points = rank.bookings * very_heavy_calculation(clown_obj.contract.to_sym)
    rank
  end

  # Lets pretend that this is a heavy calculation
  # that's why we don't want to call it when there are no bookings
  def very_heavy_calculation(symbol)
    case symbol
      when :fulltime
        2
      when :student
        3
      else
        1
    end
  end
end