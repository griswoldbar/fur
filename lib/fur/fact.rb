module Fur
  class Fact
    attr_reader :code, :middle, :predicate

    def self.from_input(input)
      matches = input.match(/^(are )?(?<code>all|some|no) (?<middle>\S*) (are )?(?<negation>not)? ?(?<predicate>.*)\??$/)
      if matches[:negation] && matches[:code] == "some"
        code = "some_not"
      else
        code = matches[:code]
      end
      new(code, matches[:middle], matches[:predicate])
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