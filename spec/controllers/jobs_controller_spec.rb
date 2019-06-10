require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  describe "Jobs index page" do
    it "Returns status code 200" do
      get :index
      expect(response.status).to eq(200)
    end

    it "gets all the jobs" do
      expect(Job).to receive(:all)
      get :index
    end
  end
end
