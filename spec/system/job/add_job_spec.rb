require "rails_helper"

RSpec.describe "Adding a job to a business", type: :system do
  it "can add add a new job to a business" do
    visit new_business_path
    fill_in "Name", with: "FAKE BUSINESS"
    fill_in "Business type", with: "FAKE TYPE"
    click_on("Create Business")
    click_link('add-job-FAKE BUSINESS')
    expect(page).to have_content("Add a Job")
    fill_in "Title", with: "Salary Man"
    fill_in "Description", with: "Very important"
    fill_in "Pay", with: 250
    select("available", :from => "availability")
    click_on("Create Job")
    expect(page).to have_content("FAKE BUSINESS")
    expect(page).to have_content("Salary Man")
    expect(page).to have_content("Very important")
    expect(page).to have_content("250")
    expect(page).to have_content("Yes")
  end

  it "redirects back to the add job page if the job isn't created" do
    visit new_business_path
    fill_in "Name", with: "FAKE BUSINESS"
    fill_in "Business type", with: "FAKE TYPE"
    click_on("Create Business")
    click_link('add-job-FAKE BUSINESS')
    expect(page).to have_content("Add a Job")
    click_on("Create Job")
    expect(page).to have_content("Sorry the job couldn't be created. Please try again.")
  end
end
