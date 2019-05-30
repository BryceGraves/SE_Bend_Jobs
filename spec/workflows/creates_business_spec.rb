require "rails_helper"

RSpec.describe CreatesBusiness do
  let(:creator) { CreatesBusiness.new(name: "FAKE BUSINESS") }
  let(:bad_creator_no_name) { CreatesBusiness.new(name: "") }
  let(:bad_creator_duplicate_name) { CreatesBusiness.new(name: "FAKE BUSINESS") }
  
  describe "When a business is created" do
    it "It has the name specified" do
      creator.build

      expect(creator.business.name).to eq("FAKE BUSINESS")
    end
  end
  
  describe "An error is thrown if" do
    it "A business is created without a name" do
      bad_creator_no_name.create

      expect(bad_creator_no_name.business.errors.messages[:name][0]).to match("can't be blank")
    end

    it "A business is created with the name of another business" do
      creator.create
      bad_creator_duplicate_name.create

      expect(bad_creator_duplicate_name.business.errors.messages[:name][0]).to match("has already been taken")
    end
  end

end
