require "rails_helper"

RSpec.describe "Add business", type: :system do
  it "User is able to add a business" do
    visit new_business_path
    fill_in "Name", with: "Denny's"
    fill_in "Business type", with: "Food Place"
    click_on("Create Business")
    expect(page).to have_content("Denny's")
    expect(page).to have_content("Food Place")
  end

  it "User is redirected back to page if create fails do to blank or duplicate name" do
    visit new_business_path
    fill_in "Name", with: ""
    click_on("Create Business")
    expect(page).to have_content("New Business\nName")
  end

  it "User is redirected back to page if create fails do to blank type" do
    visit new_business_path
    fill_in "Business type", with: "FAKE TYPE"
    click_on("Create Business")
    expect(page).to have_content("New Business\nName")
  end
end
