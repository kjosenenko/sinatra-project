User.destroy_all
Listing.destroy_all
Bid.destroy_all

leo = User.create(:username => "Leo", :password => "password")
ralph = User.create(:username => "Ralph", :password => "password")
mikey = User.create(:username => "Mikey", :password => "password")
donnie = User.create(:username => "Donnie", :password => "password")

job = Listing.create(:title => "job", :description => "A job", user:leo)
remodel = Listing.create(:title => "remodel", :description => "Another job", user:ralph)
kitchen = Listing.create(:title => "kithen", :description => "Kithcen remodel", user:ralph)
bathroom = Listing.create(:title => "bathroom", :description => "Bathroom remodel", user:mikey)
lighttech = Listing.create(:title => "lighting tech", :description => "Need an audio engineer for our gig", user:mikey)
driver = Listing.create(:title => "driver", :description => "Looking for a driver for the evening", user:donnie)
caterer = Listing.create(:title => "caterer", :description => "We need our wedding caterer", user:donnie)
roofer = Listing.create(:title => "roofer", :description => "Looking for a good roofer to replace a roof", user:leo)
sound = Listing.create(:title => "audio engineer", :description => "Need an audio engineer for our album", user:ralph)

Bid.create(:amount => 900, :message => "I'll do a great job!", user:mikey, listing:job)
Bid.create(:amount => 400, :message => "You can't beat this offer!", user:donnie, listing:job)
Bid.create(:amount => 1200, :message => "Have you seen my other work?", user:ralph, listing:job)
Bid.create(:amount => 700, :message => "How soon do you need it done?", user:mikey, listing:remodel)
Bid.create(:amount => 1000, :message => "I can start tomorrow.", user:donnie, listing:remodel)
Bid.create(:amount => 900, :message => "I'll do a great job!", user:mikey, listing:kitchen)
Bid.create(:amount => 400, :message => "You can't beat this offer!", user:donnie, listing:kitchen)
Bid.create(:amount => 1200, :message => "Have you seen my other work?", user:leo, listing:kitchen)
Bid.create(:amount => 700, :message => "How soon do you need it done?", user:leo, listing:bathroom)
Bid.create(:amount => 1000, :message => "I can start tomorrow.", user:donnie, listing:bathroom)
Bid.create(:amount => 900, :message => "I'll do a great job!", user:leo, listing:lighttech)
Bid.create(:amount => 400, :message => "You can't beat this offer!", user:donnie, listing:lighttech)
Bid.create(:amount => 1200, :message => "Have you seen my other work?", user:ralph, listing:lighttech)
Bid.create(:amount => 700, :message => "How soon do you need it done?", user:mikey, listing:driver)
Bid.create(:amount => 1000, :message => "I can start tomorrow.", user:leo, listing:driver)
Bid.create(:amount => 700, :message => "How soon do you need it done?", user:mikey, listing:caterer)
Bid.create(:amount => 1000, :message => "I can start tomorrow.", user:leo, listing:caterer)
Bid.create(:amount => 900, :message => "I'll do a great job!", user:mikey, listing:roofer)
Bid.create(:amount => 400, :message => "You can't beat this offer!", user:donnie, listing:roofer)
Bid.create(:amount => 1200, :message => "Have you seen my other work?", user:ralph, listing:roofer)
Bid.create(:amount => 700, :message => "How soon do you need it done?", user:mikey, listing:sound)
Bid.create(:amount => 1000, :message => "I can start tomorrow.", user:donnie, listing:sound)

