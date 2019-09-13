describe Conferences::Track do
  let(:morning) { Conferences::Session.new('Morning', 9, 12) }
  let(:track) { Conferences::Track.new('Track 1', [morning]) }

  describe '.duration' do
    let(:afternoon) { Conferences::Session.new('Afternoon', 13, 17) }
    let(:track) { Conferences::Track.new('Track 1', [morning, afternoon]) }

    it 'returns the sum of sessions duration' do
      expect(track.duration).to eql 7*60
    end
  end

  describe '.distribute' do
    context 'when talks fits the track' do
      let(:talks) do
        [
          Conferences::Talk.new('Accounting-Driven Development 45min'),
          Conferences::Talk.new('Common Ruby Errors 45min'),
          Conferences::Talk.new('Java Errors 45min'),
          Conferences::Talk.new('PHP Bugs 45min')
        ]
      end
      it 'should distribute all normally' do
        expect(track.distribute(talks)).to be_empty
      end
    end

    context 'when does not fit' do
      let(:talks) do
        [
          Conferences::Talk.new('Accounting-Driven Development 45min'),
          Conferences::Talk.new('Common Ruby Errors 45min'),
          Conferences::Talk.new('Java Errors 45min'),
          Conferences::Talk.new('PHP Bugs 60min'),
          Conferences::Talk.new('PHP Bugs 20min')
        ]
      end

      it 'returns the talk that does not fit' do
        expect(track.distribute(talks).count).to eql 1
      end
    end
  end
end
