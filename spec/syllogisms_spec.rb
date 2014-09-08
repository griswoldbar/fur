require 'spec_helper'

describe Fur do
  let(:fact_repo)                { Fur::FactRepo.new }
  let(:question_handler_factory) { Fur::QuestionHandler::Factory }
  let(:reasoner)                 { Fur::Reasoner.new(fact_repo, question_handler_factory) }
  let(:handler)                  { Fur::Handler.new(reasoner) }

  describe "Barbara / Barbari" do
    before(:each) do
      handler.handle("All men are stupid")
      handler.handle("All men are mortal")
      handler.handle("All Greeks are men")
      handler.handle("All cats are cute")
      handler.handle("All cats are mortal")
    end
    it "infers SaP" do
      expect(handler.handle("Are all Greeks mortal?")).to eql "Yes"
    end

    it "infers not-SeP " do
      expect(handler.handle("Are no Greeks mortal?")).to eql "No"
    end

    it "infers SiP" do
      expect(handler.handle("Are some Greeks mortal?")).to eql "Yes"
    end

    it "infers not-SoP" do
      expect(handler.handle("Are some Greeks not mortal?")).to eql "No"
    end
  end
end