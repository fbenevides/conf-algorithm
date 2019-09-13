module Conferences
  class Conference
    attr_reader :talks

    DEFAULT_TRACKS = [Track.new('Track 1'), Track.new('Track 2')]

    def initialize(talks, tracks = DEFAULT_TRACKS)
      @talks = talks
      @tracks = tracks
    end

    def self.load(file)
      talks = []

      File.readlines(file).each do |line|
        talks << Talk.new(line)
      end

      Conference.new(talks)
    end

    def fits?
      duration_of_talks = @talks.map(&:duration).reduce(&:+)
      duration_of_tracks = @tracks.map(&:duration).reduce(&:+)

      duration_of_talks <= duration_of_tracks
    end

    def process
      raise ArgumentError, 'Conference does not fit the tracks' unless fits?

      @tracks.each do |track|
        @talks = track.distribute(@talks)
      end
    end

    def complete?
      @talks.empty?
    end

    def show
      puts 'Conference: '
      @tracks.each do |track|
        track.show
      end
    end
  end
end
