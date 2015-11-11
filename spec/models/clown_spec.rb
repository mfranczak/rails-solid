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

end