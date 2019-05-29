require "rails_helper"

RSpec.describe CreatesBusiness do
  let(:creator) { CreatesBusiness.new(name: "TEST BUSINESS", job_string: job_string) }

  describe "initialization" do
    let(:job_string) { "" }

    it "creates a business given a name" do
      creator.build
      expect(creator.business.name).to eq("TEST BUSINESS")
    end
  end
end
