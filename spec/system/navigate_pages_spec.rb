require 'rails_helper'

RSpec.describe 'Visiting the correct pages', type: :system do
  context 'landing page' do
    it 'can visit the root page' do
      visit root_path
      expect(page).to have_content('Bend Jobs Now!')
    end

    it 'can click the link to see all the businesses' do
      visit root_path
      click_link('Find Businesses Today!')
      expect(page).to have_content('ALL BUSINESSES')
    end
  end

  context 'business index page' do
    it 'can click the link to see all the jobs' do
      visit businesses_path
      click_link('See All Jobs')
      expect(page).to have_content('All Jobs')
    end

    it 'can click the link to add a new business' do
      visit businesses_path
      click_link('Add New Business')
      expect(page).to have_content('New Business')
    end
  end

  context 'jobs index page' do
    it 'can click a link to see all the businesses' do
      visit jobs_path
      click_link('See All Businesses')
      expect(page).to have_content('ALL BUSINESSES')
    end
  end

end
 