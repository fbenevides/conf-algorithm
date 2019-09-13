describe Conferences::Talk do
  let(:talk) { Conferences::Talk.new('Writing Fast Tests Against Enterprise Rails 60min') }

  describe '.title' do
    it 'returns the title of the talk' do
      expect(talk.title).to eql 'Writing Fast Tests Against Enterprise Rails'
    end
  end

  describe '.duration' do
    it 'returns the duration of the talk' do
      expect(talk.duration).to eql 60
    end
  end
end
