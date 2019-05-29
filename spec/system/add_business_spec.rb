require "rails_helper"

RSpec.describe "adding a business", type: :system do
  it "allows a user to add a business" do
    visit new_business_path
    fill_in "Name", with: "Denny's"
    click_on("Create Business")
    expect(page).to have_content("Denny's")
  end
end
