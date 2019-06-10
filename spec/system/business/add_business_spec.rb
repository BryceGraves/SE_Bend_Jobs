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

  it "User can upload an image to be used as a logo" do
    visit new_business_path
    fill_in "Name", with: "Applebees"
    fill_in "Business type", with: "Casual Dining"
    attach_file("business_logo", Rails.root + "public/nick.jpg")
    click_on("Create Business")
    expect(page).to have_css("#custom-logo")
  end

  it "The logo will be a default image if the user doesn't upload one" do
    visit new_business_path
    fill_in "Name", with: "LOGOLESS BUSINESS"
    fill_in "Business type", with: "we're not sure"
    click_on("Create Business")
    expect(page).to have_css("#default-logo")
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
