require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "top_secret"
  end

  get '/' do 
    erb :index
  end

  helpers do
    def current_user(session_hash)
      @user ||= User.find(session_hash[:user_id])
    end

    def logged_in?(session_hash)
      !!session_hash[:user_id]
    end
  end
end