module Fur
  class Question
    attr_reader :code, :middle, :predicate

    def initialize(input)
      matches = input.match(/^(are) (?<code>all|some|no) (?<middle>.*) (?<predicate>.*)\?$/)
      @code = matches[:code]
      @middle = matches[:middle]
      @predicate = matches[:predicate]
    end
  end
end