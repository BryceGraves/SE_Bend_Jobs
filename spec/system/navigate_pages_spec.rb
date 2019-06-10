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
      expect(page).to have_content('All businesses')
    end
  end

  context 'business index page' do
    it 'can click the link to see all the jobs' do
      visit businesses_path
      click_link('All Jobs')
      expect(page).to have_content('All Jobs')
    end

    it 'can click the link to add a new business' do
      visit businesses_path
      click_link('Add New Business')
      expect(page).to have_content('New Business')
    end

    it 'can click a link to view a businesses jobs' do
      visit businesses_path
      click_link('Add New Business')
      fill_in 'Name', with: 'FAKE BUSINESS NAME'
      fill_in 'Business type', with: 'FAKE SERVICE'
      click_on('Create Business')
      click_link('view-business-FAKE BUSINESS NAME')
      expect(page).to have_content('FAKE BUSINESS NAME Jobs')
    end

    it 'can click a link to add a job to a business' do
      visit businesses_path
      click_link('Add New Business')
      fill_in 'Name', with: 'FAKE BUSINESS NAME'
      fill_in 'Business type', with: 'FAKE SERVICE'
      click_on('Create Business')
      click_link('add-job-FAKE BUSINESS NAME')
      expect(page).to have_content('Add a Job')
    end
  end

  context 'jobs index page' do
    it 'can click a link to see all the businesses' do
      visit jobs_path
      click_link('All Businesses')
      expect(page).to have_content('All businesses')
    end

    it 'can click a link to view all the other jobs for a business' do
      visit businesses_path
      click_link('Add New Business')
      fill_in 'Name', with: 'FAKE BUSINESS NAME'
      fill_in 'Business type', with: 'FAKE SERVICE'
      click_on('Create Business')
      click_link('add-job-FAKE BUSINESS NAME')
      fill_in 'Title', with: 'FAKE POSITION'
      fill_in 'Description', with: 'FAKE DESCRIPTION'
      fill_in 'Pay', with: 123.50
      select("available", :from => "availability")
      click_on("Create Job")
      visit jobs_path
      click_link('View FAKE BUSINESS NAME')
      expect(page).to have_content('FAKE BUSINESS NAME Jobs')
    end
  end

  context 'page showing a business' do
    it 'can click a link to add a job to the current business' do
      visit businesses_path
      click_link('Add New Business')
      fill_in 'Name', with: 'FAKE BUSINESS NAME'
      fill_in 'Business type', with: 'FAKE SERVICE'
      click_on('Create Business')
      click_link('view-business-FAKE BUSINESS NAME')
      click_link('Add Job')
      expect(page).to have_content('Add a Job')
    end
  end

end
 