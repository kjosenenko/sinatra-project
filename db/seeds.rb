User.destroy_all
Listing.destroy_all
Bid.destroy_all

leo = User.create(:username => "Leo", :password => "password")
ralph = User.create(:username => "Ralph", :password => "password")
mikey = User.create(:username => "Mikey", :password => "password")
donnie = User.create(:username => "Donnie", :password => "password")

job = Listing.create(:title => "job", :description => "A job", user:leo)
remodel = Listing.create(:title => "remodel", :description => "Another job", user:ralph)

Bid.create(:amount => 900, :message => "I'll do a great job!", user:mikey, listing:job)
Bid.create(:amount => 400, :message => "You can't beat this offer!", user:donnie, listing:job)
Bid.create(:amount => 1200, :message => "Have you seen my other work?", user:ralph, listing:job)

Bid.create(:amount => 700, :message => "How soon do you need it done?", user:mikey, listing:remodel)
Bid.create(:amount => 1000, :message => "I can start tomorrow.", user:donnie, listing:remodel)