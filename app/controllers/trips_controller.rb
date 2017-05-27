class TripsController < ApplicationController
  get '/trips' do
    erb :'/trips/index'
  end

  get '/trips/new' do # create trip
    erb :'/trips/new'
  end

  post '/trips' do
    @trip = Trip.new(params[:trip])
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

  get '/trips/:id/edit' do # edit trip
    @trip = Trip.find(params[:id])
    erb :'/trips/edit'
  end

  patch '/trips/:id' do
    @trip = Trip.find(params[:id])
    @trip.update(params[:trip])

    redirect "/trips/#{@trip.id}"
  end

  delete '/trips/:id/delete' do
    trip = Trip.find(params[:id])
    trip.destroy!
    redirect '/trips'
  end

end

