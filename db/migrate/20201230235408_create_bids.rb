class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.string :message
      t.integer :amount
      t.integer :user_id
      t.integer :listing_id
    end
  end
end
