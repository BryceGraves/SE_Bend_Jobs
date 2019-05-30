require "rails_helper"

RSpec.describe "adding a job to a business", type: :system do
  it "can add add a new job to a business" do
    skip
    visit new_business_path
    fill_in "Name", with: "FAKE BUSINESS"
    click_on("Create Business")
    expect(page).to have_content("FAKE BUSINESS")
    click_on("add-job")
    fill_in "Title", with: "Line Cook"
    fill_in "Description", with: "You will cook things fast!"
    fill_in "Pay", with: 9.50
    select("available", :from => "availability")
    click_on("Create Job")
    expect(page).to have_content("Line Cook")
  end
end