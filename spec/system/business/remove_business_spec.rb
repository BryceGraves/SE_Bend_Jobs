require "rails_helper"

RSpec.describe "Remove a business", type: :system do
  it "A user can remove a business" do
    visit new_business_path
    fill_in "Name", with: "FAKE BUSINESS"
    fill_in "Business type", with: "FAKE TYPE"
    click_on("Create Business")
    click_link('delete-business-FAKE BUSINESS')
    expect(page).not_to have_content("FAKE BUSINESS")
    expect(page).not_to have_content("FAKE TYPE")
  end

  it "When a user removes a business it removes all jobs associated with it." do
    visit new_business_path
    fill_in "Name", with: "FAKE BUSINESS"
    fill_in "Business type", with: "FAKE TYPE"
    click_on("Create Business")
    click_link('add-job-FAKE BUSINESS')
    expect(page).to have_content("Add a Job")
    fill_in "Title", with: "FAKE TITLE ONE"
    fill_in "Description", with: "FAKE DESCRIPTION"
    fill_in "Pay", with: 1
    select("available", :from => "availability")
    click_on("Create Job")
    click_link('add-job-FAKE BUSINESS')
    expect(page).to have_content("Add a Job")
    fill_in "Title", with: "FAKE TITLE TWO"
    fill_in "Description", with: "FAKE DESCRIPTION"
    fill_in "Pay", with: 2
    select("available", :from => "availability")
    click_on("Create Job")
    click_link('add-job-FAKE BUSINESS')
    expect(page).to have_content("Add a Job")
    fill_in "Title", with: "FAKE TITLE THREE"
    fill_in "Description", with: "FAKE DESCRIPTION"
    fill_in "Pay", with: 3
    select("available", :from => "availability")
    click_on("Create Job")
    visit jobs_path
    expect(page).to have_content("FAKE TITLE ONE")
    expect(page).to have_content("FAKE TITLE TWO")
    expect(page).to have_content("FAKE TITLE THREE")
    visit businesses_path
    click_link("delete-business-FAKE BUSINESS")
    visit jobs_path
    expect(page).not_to have_content("FAKE TITLE ONE")
    expect(page).not_to have_content("FAKE TITLE TWO")
    expect(page).not_to have_content("FAKE TITLE THREE")
  end
end
