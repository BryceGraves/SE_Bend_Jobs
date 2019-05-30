require "rails_helper"

RSpec.describe CreatesJob do
  let(:creator) { CreatesJob.new(title: "FAKE JOB TITLE", description: "FAKE DESCRIPTION",  pay: 42, available: true) }
  let(:bad_creator_no_title) { CreatesJob.new(title: "", description: "FAKE DESCRIPTION",  pay: 42, available: true) }
  let(:bad_creator_long_desc) {
    CreatesJob.new(title: "FAKE JOB TITLE",
      description: "FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS FILLER CHARACTERS " +
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
      available: true)
  }
  let(:bad_creator_no_pay) { CreatesJob.new(title: "", description: "FAKE DESCRIPTION",  pay: nil, available: true) }
  let(:bad_creator_no_availability) { CreatesJob.new(title: "", description: "FAKE DESCRIPTION",  pay: 42, available: nil) }
  
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
  
  describe "An error is thrown if" do
    it "A job is created without a title" do
      bad_creator_no_title.create
      expect(bad_creator_no_title.job.errors.messages[:title][0]).to match("can't be blank")
    end
    
    it "A job is created with a description greater that 1000 characters" do
      bad_creator_long_desc.create
      expect(bad_creator_long_desc.job.errors.messages[:description][0]).to match("is too long (maximum is 1000 characters)")
    end
    
    it "A job is created without pay" do
      bad_creator_no_pay.create
      expect(bad_creator_no_pay.job.errors.messages[:pay][0]).to match("is not a number")
    end
    
    it "A job is created without availability" do
      bad_creator_no_availability.create
      expect(bad_creator_no_availability.job.errors.messages[:available][0]).to match("is not included in the list")
    end    
  end

end
