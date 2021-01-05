# KJ's List

### About this application

The intent of this application is for user's to connect for gig jobs. A user can post a job they need done, and another user can respond to that posting with a bid, similar to how job's are bidded out to private contractors for contracts with government or large corporations. Rather than relying on word of mouth advertising and networking, which can be expensive for small contractors and gig workers, this application would serve as a forum to connect such workers to jobs. Similar to Craigslist, anyone could post jobs in an open forum. It differs however in that the responses are direct bids on the job, cutting out a lot of back and forth and saving time for both parties involved.

### Installation

Clone this repostiory into your directory.

Navigate to the new directory then execute:
```
$ bundle install
```
Make sure to run both of the following commands
```
$ rake db:migrate

$ rake db:seed
```
From there you can run the app by executing the shotgun command and serving on port :9393
```
$ shotgun
```

### Using this application

The seed file contains 4 users to login with (Leo, Ralph, Mikey, and Donnie) each with the password "password". Each are already seeded with listings and bids belonging to each in order to provide a better demo of this app. New users can also create new users of their own through the 'signup' feature to 'login' with. 

Once logged in, the user is redirected to the listings page which shows all listings. From there users can either add a new listing, view all of the listings which belong to them, view all of the bids that belong to them, or view one of the listings from the list shown of all listings.

When viewing a listing belonging to them, a user has the option to edit and delete the listing, or view all of the bids belonging to that listing. When viewing a listing that does not belong to them, a user can create a new bid for that listing.

When viewing a bid belonging to the logged in user, that user can edit or delete that particular bid.

### Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kjosenenko/sinatra-project.

### License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
