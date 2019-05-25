require "rails_helper"

RSpec.describe Job, type: :model do
  let(:new_job) { FactoryBot.build_stubbed(:job, :new_available) }
  let(:old_job) { FactoryBot.build_stubbed(:job, :old_available) }
  let(:no_pay) { FactoryBot.build_stubbed(:job, :nopay) }

  it "creates a job with a title and description" do
    job = FactoryBot.create(:job)

    expect(job.title).to eq("Fake Title")
    expect(job.description).to eq("Fake Description")
  end

  it "Has a new job with availability" do
    expect(new_job.available).to be_truthy
    expect(new_job.created_at.ctime).to eq(1.day.ago.ctime)
  end

  it "Has an old job with availability" do
    expect(old_job.available).to be_truthy
    expect(old_job.created_at.ctime).to eq(6.months.ago.ctime)
  end

  it "Doesn't accept a job with no pay" do
    # byebug
    skip
    refute(no_pay)
  end
end
