class TripsController < ApplicationController
  get '/trips' do
    erb :'/trips/index'
  end

  get '/trips/new' do # create trip
    erb :'/trips/new'
  end

  post '/trips' do
    @trip = Trip.new(params)
    @trip.user_id = session[:user_id]

    if @trip.save
      redirect "/trips/#{@trip.id}"
    else
      redirect '/trips/new'
    end
  end

  get '/trips/:id' do # show trip
    @trip = Trip.find(params[:id])
    erb :'/trips/show'
  end

end

