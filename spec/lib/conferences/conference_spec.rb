describe Conferences::Conference do
  let(:file) { './spec/fixtures/conf.txt' }

  describe '.load' do
    it 'should load all talks from a file' do
      conference = Conferences::Conference.load(file)
      expect(conference.talks.count).to eql 19
    end
  end

  describe '.process' do
    let(:conf) { Conferences::Conference.load(file) }

    it 'should distribute talks in tracks' do
      conf.process
      expect(conf.complete?).to be_truthy
    end

    context 'when its not possible to complete the conference' do
      let(:file) { './spec/fixtures/impossible.txt' }

      it 'raises an argument error with message' do
        expect { conf.process }.to raise_error(ArgumentError)
      end
    end
  end
end
