User.destroy_all
Listing.destroy_all
Bid.destroy_all

leo = User.create(:username => "Leo", :password => "password")
ralph = User.create(:username => "Ralph", :password => "password")
mikey = User.create(:username => "Mikey", :password => "password")
donnie = User.create(:username => "Donnie", :password => "password")

Listing.create(:title => "job", :description => "A job", user:leo)