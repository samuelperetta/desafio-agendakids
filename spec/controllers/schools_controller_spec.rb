require 'rails_helper'
require 'support/controller_auth'

RSpec.describe SchoolsController, type: :controller do

  describe SchoolsController do
  	auth_user
  	
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
