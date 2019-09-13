describe Conferences::Session do
  let(:session) { Conferences::Session.new('Morning', 9, 12) }
  let(:talk) { Conferences::Talk.new('Testing 23min') }

  describe '.duration' do
    it 'returns the total duration of a session' do
      expect(session.duration).to be 180
    end
  end

  describe '.<<' do
    it 'adds a talk to the session' do
      session << talk
      expect(session.talks.count).to eq 1
    end
  end

  describe '.total' do
    context 'when theres no talks' do
      it 'returns zero' do
        expect(session.total).to be_zero
      end
    end
    it 'returns a total duration of talks' do
      session << talk
      expect(session.total).to be 23
    end
  end
end
