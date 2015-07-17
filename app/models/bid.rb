class Bid < ActiveRecord::Base

  validates :price, presence: true
  validates :auction_id, presence: true
  validate :higher_price


  belongs_to :auction

  private

  def higher_price
    auction = Auction.find(auction_id)
    unless price > auction.current_price
      errors.add(:price, "Must be greater than current bid price")
    end
    auction.update(current_price: price)
  end
end
