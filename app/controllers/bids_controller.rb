class BidsController < ApplicationController

    #index all bids made by user
    get '/bids' do
        @bids = Bid.all
        erb :'bids/index'
    end

    #index all bids for a listing
    get '/listings/:id/bids' do
        @listing = Listing.find_by_id(params[:id])
        @bids = Bid.select {|bid| bid.listing_id == params[:id].to_i}
        erb :'bids/index'
    end

    #create new bid form
    get '/bids/new/:id' do
        @listing = Listing.find_by_id(params[:id])
        erb :'bids/new'
    end

    #post new bid
    post '/bids' do
        @bid = Bid.create(params)
        redirect to "/bids/#{@bid.id}"
    end

    #show a bid
    get '/bids/:id' do
        @bid = Bid.find_by_id(params[:id])
        erb :'bids/show'
    end

    #edit a bid form
    get '/bids/:id/edit' do
        @bid = Bid.find_by_id(params[:id])
        erb :'bids/edit'
    end

    #update bid in db
    patch '/bids/:id' do
        @bid = Bid.find_by_id(params[:id])
        @bid.amount = (params[:amount])
        @bid.message = (params[:message])
        @bid.save
        redirect to "/bids/#{@bid.id}"
    end

    #delete a bid
    delete '/bids/:id' do
        @bid = Bid.find_by_id(params[:id])
        @bid.delete
        redirect to "listings"
        # will redirect to user's bids
    end

end