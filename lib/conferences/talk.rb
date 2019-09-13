module Conferences
  class Talk
    attr_reader :title
    
    def initialize(description)
      @description = description
      @title = description.split(/\d[0-9]*/)[0].strip
    end

    def duration
      return 5 if title.include? 'lightning'
      @description.scan(/\d[0-9]*/)[0].to_i
    end
  end
end
