require "fur/fact"
require "fur/question"
module Fur
  class Handler
    def initialize(reasoner)
      @reasoner = reasoner
    end

    def handle(input)
      input.downcase!
      if input.match(/.*\?$/)
        question = Question.new(input)
        answer = @reasoner.answer(question)
        puts answer
      else
        fact = Fact.from_input(input)
        @reasoner.add_fact(fact)
      end
    #rescue validation errors with error message
    end
  end
end