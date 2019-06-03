require "rails_helper"

RSpec.describe CreatesJob do
  let(:business_creator) { CreatesBusiness.new(name: "FAKE BUSINESS") }
  let(:job_creator) { CreatesJob.new(title: "FAKE JOB TITLE", description: "FAKE DESCRIPTION",  pay: 42, available: true, business_id: 1) }
  let(:bad_job_creator_no_title) { CreatesJob.new(title: "", description: "FAKE DESCRIPTION",  pay: 42, available: true, business_id: 1) }
  let(:bad_job_creator_long_desc) {
    CreatesJob.new(title: "FAKE JOB TITLE",
      description:  "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS " +
                    "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS " +
                    "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS " +
                    "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS " +
                    "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS " +
                    "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS " +
                    "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS " +
                    "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS " +
                    "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS " +
                    "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS " +
                    "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS " +
                    "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS " +
                    "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS " +
                    "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS " +
                    "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS " +
                    "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS ",
      pay: 42,
      available: true, business_id: 1)
  }
  let(:bad_job_creator_no_pay) { CreatesJob.new(title: "FAKE TITLE", description: "FAKE DESCRIPTION",  pay: nil, available: true, business_id: 1) }
  let(:bad_job_creator_no_availability) { CreatesJob.new(title: "FAKE TITLE", description: "FAKE DESCRIPTION",  pay: 42, available: nil, business_id: 1) }
  
  describe "When a job is created" do
    it "It has the title specified" do
      job_creator.build

      expect(job_creator.job.title).to eq("FAKE JOB TITLE")
    end
    
    it "It has the description specified" do
      job_creator.build

      expect(job_creator.job.description).to eq("FAKE DESCRIPTION")
    end

    it "It has the pay specified" do
      job_creator.build

      expect(job_creator.job.pay).to eq(42)
    end
    
    it "It has an availability" do
      job_creator.build

      expect(job_creator.job.available).to eq(true)
    end
  end

  describe "An created job is invalid if" do
    it "It is created without a title" do
      bad_job_creator_no_title.build
      expect(bad_job_creator_no_title.job.valid?).to eq(false)
    end
    
    it "It is created with a description greater that 1000 characters" do
      bad_job_creator_long_desc.build

      expect(bad_job_creator_long_desc.job.valid?).to eq(false)
    end
    
    it "It is created without pay" do
      bad_job_creator_no_pay.build

      expect(bad_job_creator_no_pay.job.valid?).to eq(false)
    end
    
    it "It is created without availability" do
      bad_job_creator_no_availability.build

      expect(bad_job_creator_no_availability.job.valid?).to eq(false)
    end    
  end
  
  describe "An error is thrown if" do
    it "A job is created without a title" do
      business_creator.create

      expect { bad_job_creator_no_title.create }.to raise_error("Validation failed: Title can't be blank")
    end
    
    it "A job is created with a description greater that 1000 characters" do
      business_creator.create

      expect { bad_job_creator_long_desc.create }.to raise_error("Validation failed: Description is too long (maximum is 1000 characters)")
    end
    
    it "A job is created without pay" do
      business_creator.create

      expect { bad_job_creator_no_pay.create }.to raise_error("Validation failed: Pay is not a number")
    end
    
    it "A job is created without availability" do
      business_creator.create

      expect { bad_job_creator_no_availability.create }.to raise_error("Validation failed: Available is not included in the list")
    end    
  end

end
