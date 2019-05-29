require "rails_helper"

RSpec.describe Job, type: :model do
  let(:valid_job) { FactoryBot.build_stubbed(:job) }
  let(:valid_job_no_description) { FactoryBot.build_stubbed(:job, :no_description) }
  let(:invalid_job_no_title) { FactoryBot.build_stubbed(:job, :no_title) }
  let(:invalid_job_no_pay) { FactoryBot.build_stubbed(:job, :no_pay) }
  let(:invalid_job_no_availability) { FactoryBot.build_stubbed(:job, :no_availability) }

  describe "A job is valid if" do 
    it "It has a title" do
      expect(valid_job.title).to eq("FAKE TITLE")
      expect(valid_job).to be_valid
    end

    it "It has a description" do
      expect(valid_job.description).to eq("FAKE DESCRIPTION")
      expect(valid_job).to be_valid
    end

    it "It does not have a description" do
      expect(valid_job_no_description.description).to eq("")
      expect(valid_job_no_description).to be_valid
    end

    it "It has a pay" do
      expect(valid_job.pay).to eq(42)
      expect(valid_job).to be_valid
    end

    it "It has an availability" do
      expect(valid_job.available).not_to eq(nil)
      expect(valid_job).to be_valid
    end
  end

  describe "A job is invalid if" do
    it "It has no title" do
      expect(invalid_job_no_title.title).to eq("")
    end

    it "It has no pay" do
      expect(invalid_job_no_pay.pay).to eq(nil)
    end

    it "It has an availability other than true or false" do
      expect(invalid_job_no_availability.available).to eq(nil)
      expect(invalid_job_no_availability).not_to be_valid
    end
  end
end
