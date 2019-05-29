require "rails_helper"

RSpec.describe CreatesJob do
  let(:creator) { CreatesJob.new(title: "FAKE JOB TITLE", description: "FAKE DESCRIPTION",  pay: 42, available: true) }

  describe "When a job is created" do
    it "It has the title specified" do
      creator.build
      expect(creator.job.title).to eq("FAKE JOB TITLE")
    end

    it "It has the description specified" do
      creator.build
      expect(creator.job.description).to eq("FAKE DESCRIPTION")
    end

    it "It has the pay specified" do
      creator.build
      expect(creator.job.pay).to eq(42)
    end

    it "It has an availability" do
      creator.build
      expect(creator.job.available).to eq(true)
    end
  end

end
