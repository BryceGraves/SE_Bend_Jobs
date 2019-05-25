require "rails_helper"

RSpec.describe "adding a job", type: :system do
  it "allows a user to add a new job" do
    visit new_job_path
  end
end
