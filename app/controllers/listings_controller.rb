class ListingsController < ApplicationController

    get '/listings' do
        @listings = Listing.all
        erb :'listings/index'
    end

    get '/listings/new' do
        erb :'listings/new'
    end

    post '/listings' do
        @listing = Listing.create(params)
        redirect to "/listings/#{@listing.id}"
    end

    get '/listings/:id' do
        @listing = Listing.find_by_id(params[:id])
        erb :'listings/show'
    end

    get '/listings/:id/edit' do
        @listing = Listing.find_by_id(params[:id])
        erb :'listings/edit'
    end

    patch '/listings/:id' do
        @listing = Listing.find_by_id(params[:id])
        @listing.title = (params[:title])
        @listing.description = (params[:description])
        @listing.save
        redirect to "/listings/#{@listing.id}"
    end

    delete '/listings/:id' do
        @listing = Listing.find_by_id(params[:id])
        @listing.delete
        redirect to "listings"
    end

end