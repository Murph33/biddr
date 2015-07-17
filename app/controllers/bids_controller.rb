class BidsController < ApplicationController

  def new
    @bid = Bid.new
  end

  def create
    bid_params = params.require(:bid).permit(:price)
    @auction = Auction.find params[:auction_id]
    @bid = @auction.bids.new bid_params
    if @bid.save
      redirect_to @auction, notice: "bid made"
    else
      @bids = @auction.bids.order("price desc")
      render "/auctions/show"

    end
  end

end
