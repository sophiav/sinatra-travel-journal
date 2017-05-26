require 'spec_helper'

describe ApplicationController do

  describe "Homepage: GET '/'" do 
    it 'loads the homepage' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include ("Welcome to Travel Journal")
    end

    it 'has a link for a new user to signup' do
      visit '/'
      expect(page.body).to include "/signup"
    end

    it 'has a link for an existing user to log in' do
      visit '/'
      expect(page.body).to include "/login"
    end
  end
end