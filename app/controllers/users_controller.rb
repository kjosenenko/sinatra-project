class UsersController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect "/listings"
        else
            erb :'users/signup'
        end
    end
    
    post '/signup' do
        @user = User.new(params)
        if @user.save 
            session[:user_id] = @user.id
            redirect "/listings"
        else
            @error = @user.errors.full_messages
            erb :'users/signup'
        end 
    end 

    get '/login' do
        if logged_in?
            redirect "/listings"
        else
            erb :'users/login'
        end
    end
    
    post '/login' do
        @user = User.find_by(username:params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] =  @user.id
            redirect "/listings"
        else 
            @error = "Please make sure you have entered the correct username & password"
            erb :'users/login'
        end 
    end 

    get '/logout' do
        session.destroy 
        redirect '/' 
    end

end