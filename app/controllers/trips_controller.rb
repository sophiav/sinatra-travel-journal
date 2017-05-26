class TripsController < ApplicationController
  get '/trips' do
    erb :'/trips/index'
  end

end

