class AuctionsController < ApplicationController

  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    auction_params = params.require(:auction).permit(:title, :details, :ends_on,
                                                  :reserve_price)
    @auction = Auction.new auction_params
    if @auction.save
      redirect_to @auction, notice: "Auction created"
    else
      render :new
    end
  end

  def show
    @auction = Auction.find params[:id]
    @bid = Bid.new
    @bids = @auction.bids.order("price desc")
  end



end
