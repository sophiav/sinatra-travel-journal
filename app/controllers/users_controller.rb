class UsersController < ApplicationController
  get '/signup' do #user signup
    if !logged_in?(session)
      erb :'/users/signup'
    else
      redirect "/trips"
    end
  end

  post '/signup' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect '/trips'
    else
      flash[:errors] = @user.errors.full_messages
      erb :'/users/signup'
    end
  end

  get '/login' do #user login
    if !logged_in?(session)
      erb :'/users/login'
    else
      redirect "/trips"
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/trips'
    else
      redirect '/signup'
    end
  end

  get '/logout' do #user logout
    if logged_in?(session)
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

  get '/users/:slug' do # user show page
    @user = User.find_by_slug(params[:slug])
    @trips = @user.trips
    erb :'/users/show'
  end 

end