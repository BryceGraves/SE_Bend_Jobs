require "rails_helper"

RSpec.describe Business do
  let(:business) {FactoryBot.build_stubbed(:business)}
  let(:with_1_job) {FactoryBot.build_stubbed(:business, :WithFullJobSalary92K)}
  let(:emptyJob) { Job.new }
  let(:fullJobSalary92K) { Job.new(title: "FAKE JOB WITH SALARY 92000", pay: 92000, description: "FAKE DESCRIPTION", available: "true") }
  let(:fullJobSalary100K) { Job.new(title: "FAKE JOB WITH SALARY 100000", pay: 100000, description: "FAKE DESCRIPTION", available: "true") }

  it "considers a business with no jobs to be not hiring" do
    expect(business).not_to be_hiring
  end

  it "knows that a business with no jobs is not hiring" do
    business.jobs << emptyJob

    expect(business).not_to be_hiring
  end

  it "marks a business as hiring if the jobs are available" do
    business.jobs << emptyJob
    emptyJob.mark_as_available

    expect(business).to be_hiring
  end

  describe "open job salary tracking" do
    it "jobs to be empty" do
      expect(business.jobs).to be_empty
    end

    it "returns 0 if there are no open jobs" do
      expect(business.open_job_salaries).to eq(0)
    end

    it "expects a business with an open job to have a salary larger than 0" do
      expect(with_1_job.open_job_salaries).to be > 0
    end

    it "can remove a job" do
      business.jobs << fullJobSalary100K

      expect(business.jobs).to include(fullJobSalary100K)

      business.remove(fullJobSalary100K)

      expect(business.jobs).to_not include(fullJobSalary100K)
    end

    it "expect a business to keep track of salarry totals" do
      business.jobs << fullJobSalary92K
      business.jobs << fullJobSalary100K

      expect(business.open_job_salaries).to eq(192000)

      business.remove(fullJobSalary100K)

      expect(business.open_job_salaries).to eq(92000)
    end
  end

end
