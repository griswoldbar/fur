module Fur
  class Fact
    attr_reader :code, :middle, :predicate

    def self.from_input(input)
      matches = input.match(/^(?<code>all|some|no) (?<middle>.*) (are) (?<predicate>.*)$/)
      new(matches[:code], matches[:middle], matches[:predicate])
    end

    def initialize(code, middle, predicate, truthiness = true)
      @code = code
      @middle = middle
      @predicate = predicate
      @truthiness = truthiness
    end

    def true?
      @truthiness
    end
  end
end