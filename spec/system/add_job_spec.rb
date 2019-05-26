require "rails_helper"

RSpec.describe "adding a job", type: :system do
  it "allows a user to add a new job" do
    visit new_job_path
    fill_in "Title", with: "Server"
    fill_in "Description", with: "You will server the hungry people their food"
    fill_in "Pay", with: 10000
    select("available", from: "availability")
    click_on("Create Job")
    visit jobs_path
    expect(page).to have_content("Server")
  end
end
