class ListingsController < ApplicationController

    get '/listings' do
        if logged_in?
            @listings = Listing.all
            erb :'listings/index_all'
        else
            redirect "/login"
        end
    end

    get '/my_listings' do
        if logged_in?
            @listings = Listing.select {|listing| listing.user_id == current_user.id}
            erb :'listings/index_user'
        else
            redirect "/login"
        end
    end

    get '/listings/new' do
        if logged_in?
            erb :'listings/new'
        else
            redirect "/login"
        end
    end

    post '/listings' do
        if logged_in?
            @listing = Listing.new(params)
                    if (session[:user_id] == @listing.user_id) && @listing.save
                    redirect "/listings/#{@listing.id}"
                else
                    @error = @listing.errors.full_messages
                    erb :'/listings/new'
                end
        else
            redirect "/login"
        end
    end

    get '/listings/:id' do
        if logged_in?
            if @listing = Listing.find_by_id(params[:id])
                erb :'listings/show'
            else
                erb :oops
            end
        else
            redirect "/login"
        end
    end

    get '/listings/:id/edit' do
        if logged_in?
            if @listing = Listing.find_by_id(params[:id])
                erb :'listings/edit'
            else
                erb :oops
            end
        else
            redirect "/login"
        end
    end

    patch '/listings/:id' do
        if logged_in? 
            @listing = Listing.find_by_id(params[:id])
            @listing.title = (params[:title])
            @listing.description = (params[:description])
            if (session[:user_id] == @listing.user_id) && @listing.save
                redirect "/listings/#{@listing.id}"
            else
                @error = @listing.errors.full_messages
                erb :'listings/edit'
            end
        else
            redirect "/login"
        end
    end

    delete '/listings/:id' do
        if logged_in?
            @listing = Listing.find_by_id(params[:id])
            if session[:user_id] == @listing.user_id
                @listing.delete
                redirect "/listings"
            else
                redirect "/listings"
            end
        else
            redirect "/login"
        end
    end

end