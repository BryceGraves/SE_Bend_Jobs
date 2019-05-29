require "rails_helper"

RSpec.describe Business do
  let(:valid_business_no_jobs) { FactoryBot.build_stubbed(:business) }
  let(:valid_business_one_job) { FactoryBot.build_stubbed(:business, :with_one_job) }
  let(:valid_business_many_jobs) { FactoryBot.build_stubbed(:business, :with_many_jobs) }

  describe "A business is valid if" do 
    it "It has a name" do
      expect(valid_business_no_jobs.name).to eq("FAKE BUSINESS")

      expect(valid_business_no_jobs).to be_valid
    end

    it "It has no jobs" do
      expect(valid_business_no_jobs.jobs.empty?).to eq(true)

      expect(valid_business_no_jobs).to be_valid
    end

    it "It has a job" do
      expect(valid_business_one_job.jobs.empty?).to eq(false)
      expect(valid_business_one_job.jobs.size).to eq(1)

      expect(valid_business_no_jobs).to be_valid
    end

    it "It has many jobs" do
      expect(valid_business_many_jobs.jobs.empty?).to eq(false)
      expect(valid_business_many_jobs.jobs.size).to eq(5)

      expect(valid_business_no_jobs).to be_valid
    end
  end

end
