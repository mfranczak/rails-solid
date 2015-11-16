require 'rails_helper'

describe Clown do
  context 'student' do
    let(:clown) { Clown.new contract: :student }

    it '#is_student?' do
      expect(clown.is_student?).to be_truthy
    end

    it '#is_parttime?' do
      expect(clown.is_parttime?).to be_falsey
    end

    it '#is_fulltime?' do
      expect(clown.is_fulltime?).to be_falsey
    end

    it '#ranking_data' do
      expect(clown.ranking_data.is_a? Ranking).to be_truthy
    end

    # this method should not be here. This is a unit test of a different class.
    # it's integrated here to check if the task was completed
    it '#ranking_data points' do
      expect(clown.ranking_data.points).to eq 10
    end
  end

  context 'parttime' do
    let(:clown) { Clown.new contract: :parttime }

    it '#is_student?' do
      expect(clown.is_student?).to be_falsey
    end

    it '#is_parttime?' do
      expect(clown.is_parttime?).to be_truthy
    end

    it '#is_fulltime?' do
      expect(clown.is_fulltime?).to be_falsey
    end

    it '#ranking_data' do
      expect(clown.ranking_data.is_a? Ranking).to be_truthy
    end
  end

  context 'fulltime' do
    let(:clown) { Clown.new contract: :fulltime }

    it '#is_student?' do
      expect(clown.is_student?).to be_falsey
    end

    it '#is_parttime?' do
      expect(clown.is_parttime?).to be_falsey
    end

    it '#is_fulltime?' do
      expect(clown.is_fulltime?).to be_truthy
    end
  end

  context 'clown with bookings' do
    let(:clown) do
      clown = Clown.new contract: :fulltime
      clown.bookings << Booking.new
      clown
    end

    it '#ranking_data' do
      expect(clown.ranking_data.is_a? Ranking).to be_truthy
    end
  end

end