require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "Welcome index page" do
    it "Returns status code 200" do
      get :index
      expect(response.status).to eq(200)
    end
  end

end