require "rails_helper"

RSpec.describe Business do
  let(:valid_business_no_jobs) { FactoryBot.build_stubbed(:business) }
  let(:valid_business_one_job) { FactoryBot.build_stubbed(:business, :with_one_job) }
  let(:valid_business_one_unavailable_job) { FactoryBot.build_stubbed(:business, :with_one_unavailable_job) }
  let(:valid_business_many_jobs) { FactoryBot.build_stubbed(:business, :with_many_jobs) }
  let(:valid_business_no_available_jobs) { FactoryBot.build_stubbed(:business, :with_no_available_jobs) }

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

  describe "A business is invalid if" do
    it "It has no name" do
      valid_business_no_jobs.name = ""

      expect(valid_business_no_jobs).not_to be_valid
    end

    it "It has no type" do
      valid_business_no_jobs.business_type = ""

      expect(valid_business_no_jobs).not_to be_valid
    end
  end

  describe "Business functionality" do
    context "A business can check what jobs are available" do
      it "If it has no jobs" do
        expected_result = Array(valid_business_no_jobs.jobs).keep_if { |job| job.available == true }

        expect(valid_business_no_jobs.available_jobs).to eq(expected_result)
      end

      it "If it has one job" do
        expected_result = Array(valid_business_one_job.jobs).keep_if { |job| job.available == true }

        expect(valid_business_one_job.available_jobs).to eq(expected_result)
      end

      it "If it has one unavailable job" do
        expected_result = Array(valid_business_one_unavailable_job.jobs).keep_if { |job| job.available == true }

        expect(valid_business_one_unavailable_job.available_jobs).to eq(expected_result)
      end

      it "If it has many jobs" do
        expected_result = Array(valid_business_many_jobs.jobs).keep_if { |job| job.available == true }

        expect(valid_business_many_jobs.available_jobs).to eq(expected_result)
      end

      it "If it has many unavailable jobs" do
        expected_result = Array(valid_business_no_available_jobs.jobs).keep_if { |job| job.available == true }

        expect(valid_business_no_available_jobs.available_jobs).to eq(expected_result)
      end
    end

    context "A business can check if has a hiring job available" do
      it "If it has one job" do
        expect(valid_business_one_job.hiring?).to eq(true)
        expect(valid_business_one_unavailable_job.hiring?).to eq(false)
      end

      it "If it has many jobs with varying availability" do
        expect(valid_business_many_jobs.hiring?).to eq(true)
        expect(valid_business_no_available_jobs.hiring?).to eq(false)
      end
    end

    context "A business can return total pay of it's jobs" do
      it "Returns zero pay if it has no jobs" do
        expect(valid_business_no_jobs.total_pay).to eq(0)
      end

      it "Returns pay if it has one or more jobs" do
        expect(valid_business_one_job.total_pay).to eq(42.0)
        expect(valid_business_many_jobs.total_pay).to eq(15.0)
      end
    end

    context "A business can remove a job" do
      it "Removing a job returns the job removed" do
        removed_job = valid_business_many_jobs.jobs[3]

        expect(valid_business_many_jobs.remove(removed_job)).to eq(removed_job)
      end

      it "A job is removed if the job passed is one of the jobs of the business" do
        removed_job = valid_business_many_jobs.jobs[3]
        valid_business_many_jobs.remove(removed_job)

        expect(valid_business_many_jobs.jobs.size).to eq(4)
      end

      it "A job is not removed if the job passed is not one of the business's jobs" do
        removed_job = Job.new(title: "FAKE JOB FOUR", pay: 4, description: "FAKE DESCRIPTION", available: false)
        valid_business_many_jobs.remove(removed_job)

        expect(valid_business_many_jobs.jobs.size).to_not eq(4)
      end
    end

    context "A business can return the average pay of it's jobs" do
      it "Returns zero pay if it has no jobs" do
        expect(valid_business_no_jobs.average_pay).to eq(0)
      end

      it "Returns the average pay if it has one or more jobs" do
        expect(valid_business_one_job.average_pay).to eq(42.0)
        expect(valid_business_many_jobs.average_pay).to eq(3.0)
      end
    end

  end

end
