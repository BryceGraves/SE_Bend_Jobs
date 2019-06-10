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
end
