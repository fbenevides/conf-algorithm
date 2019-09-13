module Conferences
  class Track
    attr_reader :name

    def initialize(name, sessions = [Session.new('Morning', 9, 12), Session.new('Afternoon', 13, 17)])
      @name = name
      @sessions = sessions
    end

    def duration
      @sessions.map(&:duration).reduce(&:+)
    end

    def distribute(talks)
      talks.sort_by(&:duration)
      removed = []

      @sessions.each do |session|
        sum = 0
        talks.each do |talk|
          if sum != session.duration
            if session.total + talk.duration <= session.duration
              session << talk
              sum += talk.duration
              removed << talk
            end
          end
        end

        talks -= removed
      end

      talks
    end

    def show
      puts "#{name}"
      @sessions.each do |session|
        puts " #{session.name}"
        session.show
        puts " "
      end
    end
  end
end
