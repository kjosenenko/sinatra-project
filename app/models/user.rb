class User < ActiveRecord::Base
    has_many :listings
    has_many :bids
    has_secure_password 
    validates :username, presence: true
    validates :username, uniqueness: true
end