require "fur/version"
require "fur/reasoner"
require "fur/handler"
require "fur/fact_repo"

module Fur
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
    @handler ||= Handler.new(reasoner)
  end

  def reasoner
    Reasoner.new(FactRepo.new)
  end
end

include Fur