require "rails_helper"

RSpec.describe "Add business", type: :system do
  it "User is able to add a business" do
    visit new_business_path
    fill_in "Name", with: "Denny's"
    click_on("Create Business")
    expect(page).to have_content("Denny's")
  end

  it "User is redirected back to page if create fails" do
    visit new_business_path
    fill_in "Name", with: ""
    click_on("Create Business")
    expect(page).to have_content("New Business\nName")
  end
end
