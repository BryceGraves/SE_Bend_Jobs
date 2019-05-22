require "rails_helper"

RSpec.describe CreatesJob do
  let(:creator) { CreatesJob.new(title: "FAKE JOB TITLE", pay: pay, description_string: description, availability: availability) }

  describe "initialization" do
    let(:pay) { "" }
    let(:description) { "" }
    let(:availability) { "" }

    it "creates a job given a title" do
      creator.build
      expect(creator.job.title).to eq("FAKE JOB TITLE")
    end
  end
end
