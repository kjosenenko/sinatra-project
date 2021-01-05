class ListingsController < ApplicationController

    #index all listings
    get '/listings' do
        if logged_in?
            @listings = Listing.all
            erb :'listings/index_all'
        else
            redirect "/login"
        end
    end

    #index all listings belonging to current user
    get '/my_listings' do
        if logged_in?
            @listings = Listing.select {|listing| listing.user_id == current_user.id}
            erb :'listings/index_user'
        else
            redirect "/login"
        end
    end

    #create new listing form
    get '/listings/new' do
        if logged_in?
            erb :'listings/new'
        else
            redirect "/login"
        end
    end

    #post new listing
    post '/listings' do
        if logged_in?
            @listing = Listing.new(params)
                    if @listing.save
                    redirect "/listings/#{@listing.id}"
                else
                    @error = @listing.errors.full_messages
                    erb :'/listings/new'
                end
        else
            redirect "/login"
        end
    end

    #show a listing
    get '/listings/:id' do
        if logged_in?
            @listing = Listing.find_by_id(params[:id])
            erb :'listings/show'
        else
            redirect "/login"
        end
    end

    #edit a listing form
    get '/listings/:id/edit' do
        if logged_in?
            @listing = Listing.find_by_id(params[:id])
            erb :'listings/edit'
        else
            redirect "/login"
        end
    end

    #update lisitng in db
    patch '/listings/:id' do
        if logged_in?
            @listing = Listing.find_by_id(params[:id])
            @listing.title = (params[:title])
            @listing.description = (params[:description])
            if @listing.save
                redirect "/listings/#{@listing.id}"
            else
                @error = @listing.errors.full_messages
                erb :'listings/edit'
            end
        else
            redirect "/login"
        end
    end

    #delete a listing
    delete '/listings/:id' do
        if logged_in?
            @listing = Listing.find_by_id(params[:id])
            @listing.delete
            redirect "/listings"
        else
            redirect "/login"
        end
    end

end