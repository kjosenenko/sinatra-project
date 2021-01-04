class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup' 
    end
    
    post '/signup' do
        if User.find_by(username:params[:username])
            @error = "This username already exists, please try logging in."
            erb :'users/login'
        else
            @user = User.new(params)
            if @user.save 
                session[:user_id] = @user.id
                redirect "/listings"
            else
                @error = @user.errors.full_messages
                erb :'users/signup'
            end 
        end
    end 

    get '/login' do
        erb :'users/login' 
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