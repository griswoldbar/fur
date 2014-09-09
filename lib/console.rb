require "fur"

module Fur
  module Console
    extend self
    def start
      while true do
        input = STDIN.gets
        handle(input)
      end
    end

    def handle(input)
      handler.handle(input)
    end

    private

    def handler
      @handler ||= Handler.new(reasoner, outputter)
    end

    def reasoner
      Reasoner.new(FactRepo.new)
    end

    def outputter
      def output(text)
        puts text
      end
    end
  end
end

include Fur::Console