# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)
        User, Bid, Listing
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
        User has many bids & listings, Listing has many bids
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
        Listing belongs to a user, a Bid belongs to a user & a listing
- [x] Include user accounts with unique login attribute (username or email)
        First checks to see if username exists
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
        New, Index, Edit, Delete
- [x] Ensure that users can't modify content created by other users
        check by comparing current_user.id to user_id of listing or bid
- [x] Include user input validations
        uses 'validates' on model
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
        displays error messages in views
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message