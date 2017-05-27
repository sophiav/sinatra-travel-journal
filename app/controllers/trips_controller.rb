class TripsController < ApplicationController
  get '/trips' do
    if logged_in?(session)
      @trips = current_user(session).trips
      erb :'/trips/index'
    else
      redirect '/login'
    end
  end

  get '/trips/new' do # create trip
    if logged_in?(session)
      erb :'/trips/new'
    else
      redirect "/login"
    end
  end

  post '/trips' do
    @trip = Trip.new(params[:trip])
    @trip.user_id = current_user(session).id

    if @trip.save
      redirect "/trips/#{@trip.id}"
    else
      redirect '/trips/new'
    end
  end

  get '/trips/:id' do # show trip
    @trip = current_user(session).trips.find_by(id: params[:id])

    if logged_in?(session) && @trip
      erb :'/trips/show'
    else
      redirect '/trips'
    end
  end

  get '/trips/:id/edit' do # edit trip
    @trip = current_user(session).trips.find_by(id: params[:id])
    if logged_in?(session) && @trip
      erb :'/trips/edit'
    else
      redirect "/trips"
    end
  end

  patch '/trips/:id' do
    @trip = current_user(session).trips.find_by(id: params[:id])
    @trip.update(params[:trip])

    redirect "/trips/#{@trip.id}"
  end

  delete '/trips/:id/delete' do
    @trip = current_user(session).trips.find_by(id: params[:id])
    if @trip.user_id == current_user(session).id
      @trip.destroy!
      redirect '/trips'
    else
      redirect '/trips'
    end
  end

end

