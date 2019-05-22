require "rails_helper"

RSpec.describe "adding a business", type: :system do
  it "allows user to create a business with open jobs" do
    visit new_business_path

    fill_in "Name", with: "FAKE BUSINESS NAME"
    fill_in "Jobs", with: "FAKE JOB DEV:70000:FAKE DESCRIPTION:Available"

    click_on("Create Business")

    visit businesses_path

    @business = Business.find_by(name: "FAKE BUSINESS NAME")

    expect(page).to have_selector(
      "#business_#{@business.id} .name", text: "FAKE BUSINESS NAME",
    )

    expect(page).to have_content("FAKE BUSINESS NAME")
    expect(page).to have_content("FAKE JOB DEV")
    expect(page).to have_content(70000)
    expect(page).to have_content("FAKE DESCRIPTION")
    expect(page).to have_content(true)
  end

  it "does not allow user to creat a business without a name" do
    visit new_business_path

    fill_in "Name", with: ""
    fill_in "Jobs", with: "FAKE JOB DEV:70000"

    click_on("Create Business")
    expect(page).to have_selector(".new_business")
  end
end
