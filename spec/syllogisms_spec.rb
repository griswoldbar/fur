require 'spec_helper'

describe Fur do
  let(:fact_repo)                { Fur::FactRepo.new }
  let(:reasoner)                 { Fur::Reasoner.new(fact_repo) }
  let(:handler)                  { Fur::Handler.new(reasoner) }

  describe "'All' questions (Barbara / Barbari)" do
    before(:each) do
      handler.handle("All men are mortal")
      handler.handle("All Greeks are men")
    end
    describe "correct inferences" do
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

  describe "'No' questions (Celarent)" do
    before(:each) do
      handler.handle("No cats are ugly")
      handler.handle("All Birmans are cats")
    end

    describe "correct inferences" do
      it "infers SeP" do
        expect(handler.handle("Are no Birmans ugly?")).to eql "Yes"
      end

      it "infers not-SaP " do
        expect(handler.handle("Are all Birmans ugly?")).to eql "No"
      end

      it "infers SoP" do
        expect(handler.handle("Are some Birmans not ugly?")).to eql "Yes"
      end

      it "infers not-SiP" do
        expect(handler.handle("Are some Birmans ugly?")).to eql "No"
      end
    end
  end
end