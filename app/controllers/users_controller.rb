class UsersController < ApplicationController
  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect '/trips'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    erb :'/users/login'
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

  get '/logout' do
    if Helpers.logged_in?(session)
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

end