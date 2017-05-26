class TripsController < ApplicationController
  get '/trips' do
    erb :'/trips/index'
  end

  get '/trips/new' do # create trip
    erb :'/trips/new'
  end

  post '/trips' do
    puts params
    @trip = Trip.new(name: params[:name])
    @trip.user_id = session[:user_id]

    if @trip.save
      redirect "/trips/#{@trip.id}"
    else
      redirect '/trips/new'
    end
  end

end

