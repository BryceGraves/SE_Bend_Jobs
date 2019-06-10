require "rails_helper"

RSpec.describe "Removing a job from a business", type: :system do
  it "A user can remove a job from a business" do
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
    click_link('delete-job-1')
    expect(page).not_to have_content("Salary Man")
    expect(page).not_to have_content("Very important")
    expect(page).not_to have_content("250")
    expect(page).not_to have_content("true")
  end
end
