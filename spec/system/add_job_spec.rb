require "rails_helper"

RSpec.describe "adding a job to a business", type: :system do
  it "can add add a new job to a business" do
    visit new_business_path
    fill_in "Name", with: "FAKE BUSINESS"
    click_on("Create Business")
    expect(page).to have_content("FAKE BUSINESS")
    click_on("Add Job")
  end
end