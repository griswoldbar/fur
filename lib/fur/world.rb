module Fur
  class World
    def initialize
      @things = []
      @relationships = []
    end

    def <<(fact)
      middle_id = add_thing(fact.middle)
      predicate_id = add_thing(fact.predicate)
      relationship = add_relationship(fact.code, middle_id, predicate_id)
    end

    private
    def add_thing(thing_name)
      thing = @things.find {|x| x[:name] == thing_name }
      if !thing
        id = max_thing_id + 1
        thing = {id: id, name: thing_name}
      end
      thing[:id]
    end
    
    def add_relationship(code, middle_id, predicate_id)
      unless @relationships.find {|r| r[:code] == code && r[:middle_id] == middle_id && r[:predicate_id == predicate_id]}
        @relationships << {code: code, }
    end

    def max_thing_id
       @things.map{|x| x[:id]}.max || 0
    end
  end
end