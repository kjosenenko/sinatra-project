class BidsController < ApplicationController

    #index all bids made by user
    get '/bids' do
        if logged_in?
            @bids = Bid.select {|bid| bid.user_id == current_user.id}
            erb :'bids/index_user'
        else
            redirect "/login"
        end
    end

    #index all bids for a listing
    get '/listings/:id/bids' do
        if logged_in?
            if @listing = Listing.find_by_id(params[:id])
                @bids = Bid.select {|bid| bid.listing_id == params[:id].to_i}
                erb :'bids/index_listing'
            else
                erb :oops
            end
        else
            redirect "/login"
        end
    end

    #new bid form
    get '/bids/new/:id' do
        if logged_in?
            if @listing = Listing.find_by_id(params[:id])
                erb :'bids/new'
            else
                erb :oops
            end
        else
            redirect "/login"
        end
    end

    #create new bid
    post '/bids' do
        if logged_in?
            @bid = Bid.new(params)
            if @bid.save
                redirect "/bids/#{@bid.id}"
            else
                @listing = Listing.find_by_id(params[:listing_id])
                @error = @bid.errors.full_messages
                erb :'bids/new'
            end
        else
            redirect "/login"
        end
    end

    #show a bid
    get '/bids/:id' do
        if logged_in?
            if @bid = Bid.find_by_id(params[:id])
                erb :'bids/show'
            else
                erb :oops
            end
        else
            redirect "/login"
        end
    end

    #edit a bid form
    get '/bids/:id/edit' do
        if logged_in?
            if @bid = Bid.find_by_id(params[:id])
                erb :'bids/edit'
            else
                erb :oops
            end
        else
            redirect "/login"
        end
    end

    #update bid in db
    patch '/bids/:id' do
        if logged_in?
            @bid = Bid.find_by_id(params[:id])
            @bid.amount = (params[:amount])
            @bid.message = (params[:message])
            if (session[:user_id] == @bid.user_id) && @bid.save
                redirect "/bids/#{@bid.id}"
            else
                @error = @bid.errors.full_messages
                erb :'bids/edit'
            end
        else
            redirect "/login"
        end
    end

    #delete a bid
    delete '/bids/:id' do
        if logged_in?
            @bid = Bid.find_by_id(params[:id])
            if (session[:user_id] == @bid.user_id)
                @bid.delete
                redirect "/bids"
            else
                redirect "/bids"
            end
        else
            redirect "/login"
        end
    end

end