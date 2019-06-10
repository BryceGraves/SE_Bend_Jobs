require 'rails_helper'

RSpec.describe "Visiting the correct pages", type: :system do
  context 'landing page' do
    it "can visit the root page" do
      visit root_path
      expect(page).to have_content("Bend Jobs Now!")
    end
end
 