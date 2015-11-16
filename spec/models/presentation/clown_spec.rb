describe Presentation::Clown do
  let(:subject) { Presentation::Clown.new(Clown.new) }
  it { is_expected.to respond_to :last_booking }
  it { is_expected.to respond_to :name }
end