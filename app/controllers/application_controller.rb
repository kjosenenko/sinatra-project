require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true 
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    if logged_in?
      redirect "/listings"
    else
      redirect "/login"
    end
  end

  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
  end
  
  error do
    erb :oops
  end

  not_found do
    erb :oops
  end

end
