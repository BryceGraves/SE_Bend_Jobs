require "rails_helper"

RSpec.describe CreatesJob do
  let(:creator) { CreatesJob.new(title: "FAKE JOB TITLE", pay: 42, description: "FAKE DESCRIPTION", available: true) }

  describe "initialization" do
    it "creates a job given a title" do
      creator.build
      expect(creator.job.title).to eq("FAKE JOB TITLE")
    end
  end

end
