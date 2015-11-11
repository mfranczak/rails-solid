require 'rails_helper'

describe Booking do
  let(:booking) { Booking.new clown: clown, appointment_date: Date.today }
  let(:clown) {
    clown = Clown.new contract: :fulltime
    allow(clown).to receive(:has_appointment?).and_return false
    clown
  }

  describe '#valid?' do
    context 'when appointments time is wrong' do
      it {
        expect(booking.valid?).to be_falsey
        expect(booking.errors.messages.has_key? :appointment_time)
      }
    end

    context 'when trying to make a booking for yesterday' do
      let(:booking) { Booking.new clown: clown, appointment_date: Date.yesterday, appointment_time: :morning }
      it {
        expect(booking.valid?).to be_falsey
        expect(booking.errors.messages.has_key? :appointment_date)
      }
    end

    context 'when clown already have an appointment' do
      it {
        allow(clown).to receive(:has_appointment?)
                            .and_return true

        expect(booking.valid?).to be_falsey
        expect(booking.errors.messages.has_key? :appointment_date)
      }
    end

    context 'when clown is a student' do
      let(:clown) { Clown.new contract: :student }

      it {
        allow(clown).to receive(:has_appointment?).and_return false
        allow(Booking).to receive(:where)
                              .with(clown: clown, appointment_date: booking.appointment_date)
                              .once
                              .and_return [1].to_a

        expect(booking.valid?).to be_falsey
        expect(booking.errors.messages.has_key? :appointment_date)
      }
    end

    context 'when clown is partime' do
      let(:booking) { Booking.new clown: clown, appointment_date: Date.today, appointment_time: :morning }
      let(:clown) {
        clown = Clown.new contract: :parttime
        allow(clown).to receive(:has_appointment?).and_return false
        clown
      }

      it {
        allow(Booking).to receive(:where)
                              .with(clown: clown, appointment_date: booking.appointment_date)
                              .once
                              .and_return [].to_a

        expect(booking.valid?).to be_truthy
      }

      it {
        allow(Booking).to receive(:where)
                              .with(clown: clown, appointment_date: booking.appointment_date)
                              .once
                              .and_return (1..2).to_a

        expect(booking.valid?).to be_falsey
        expect(booking.errors.messages.has_key? :appointment_date)
      }
    end
  end
end