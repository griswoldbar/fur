require "fur/fact"
module Fur
  class Handler
    def initialize(reasoner, outputter=self)
      @reasoner = reasoner
      @outputter = outputter
    end

    def handle(input)
      input.downcase!
      fact = Fact.from_input(input)
      if input.match(/.*\?$/)
        answer = @reasoner.answer(fact)
        @outputter.output(answer)
      else
        @reasoner.add_fact(fact)
      end
    #rescue validation errors with error message
    end

    def output(text)
      text
    end
  end

end