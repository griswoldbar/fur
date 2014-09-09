module Fur
  class FactRepo
    def initialize
      @facts = []
    end

    def <<(fact)
      @facts << fact
    end

    def find_related(other_fact)
      @facts.select do |fact|
        (fact.middle == other_fact.middle) || (other_fact.predicate == other_fact.predicate)
      end
    end

    def find(other_fact)
      @facts.find do |fact|
        (fact.middle == other_fact.middle) && (fact.predicate == other_fact.predicate) && (fact.code == other_fact.code)
      end
    end
  end
end