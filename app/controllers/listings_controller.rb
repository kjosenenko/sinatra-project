class ListingsController < ApplicationController

    #index all listings
    get '/listings' do
        @listings = Listing.all
        erb :'listings/index'
    end

    #create new listing form
    get '/listings/new' do
        erb :'listings/new'
    end

    #post new listing
    post '/listings' do
        @listing = Listing.create(params)
        redirect to "/listings/#{@listing.id}"
    end

    #show a listing
    get '/listings/:id' do
        @listing = Listing.find_by_id(params[:id])
        erb :'listings/show'
    end

    #edit a listing form
    get '/listings/:id/edit' do
        @listing = Listing.find_by_id(params[:id])
        erb :'listings/edit'
    end

    #update lisitng in db
    patch '/listings/:id' do
        @listing = Listing.find_by_id(params[:id])
        @listing.title = (params[:title])
        @listing.description = (params[:description])
        @listing.save
        redirect to "/listings/#{@listing.id}"
    end

    #delete a listing
    delete '/listings/:id' do
        @listing = Listing.find_by_id(params[:id])
        @listing.delete
        redirect to "listings"
    end

end