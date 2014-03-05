require 'spec_helper'

describe SessionsController do

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      expect(response).to redirect_to root_url
    end
  end

end
