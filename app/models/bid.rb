class Bid < ActiveRecord::Base
    belongs_to :user
    belongs_to :listing
    validates :amount, :message, presence: true
end