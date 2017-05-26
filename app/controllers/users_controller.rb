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
  end

  get '/logout' do
  end

end