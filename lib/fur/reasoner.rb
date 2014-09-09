require 'fur/fact'

module Fur
  class ContradictionError < StandardError;end
  class Reasoner
    def initialize(fact_repo)
      @fact_repo = fact_repo
    end

    def add_fact(fact)
      check_for_contradiction(fact)
      @fact_repo << fact
      make_inferences(fact)
    end

    def answer(question)
      if fact = @fact_repo.find(question)
        if fact.true?
          "Yes"
        else
          "No"
        end
      else
        "I don't know"
      end
    end

    private
    def check_for_contradiction(fact)
      true
    end

    def make_inferences(new_fact)
      related = @fact_repo.find_related(new_fact)
      if new_fact.code == 'all'
        related.select {|fact| (fact.middle == new_fact.predicate) && (fact.code == new_fact.code)}.each do |fact|
          @fact_repo << Fact.new('all', new_fact.middle, fact.predicate, true)
          @fact_repo << Fact.new('some', new_fact.middle, fact.predicate, true)
          @fact_repo << Fact.new('some_not', new_fact.middle, fact.predicate, false)
          @fact_repo << Fact.new('no', new_fact.middle, fact.predicate, false)
        end
      end
    end
  end
end

#what if facts contradict?
