module Conferences
  class Session
    attr_reader :duration, :talks, :name

    def initialize(name, start, finish)
      @name = name
      @start = start
      @finish = finish
      @duration = (finish - start) * 60
      @talks = []
    end

    def <<(talk)
      @talks << talk
    end

    def total
      return 0 if @talks.empty?
      @talks.map(&:duration).reduce(:+)
    end

    def show
      @talks.each do |talk|
        puts "  #{talk.title} - #{talk.duration}"
      end
    end
  end
end
