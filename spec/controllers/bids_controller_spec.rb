require 'rails_helper'

RSpec.describe BidsController, type: :controller do

  let(:auction) { create(:auction) }

  describe "#create" do
    context "with valid params" do
      def valid_request
        post :create, bid: {price: 9999}, auction_id: auction
      end

      it "creates a bid in the database" do
        expect { valid_request }.to change { Bid.count }.by(1)
      end

      it "associates the bid with the auction" do
        expect { valid_request }.to change { auction.bids.count }.by(1)
      end

      it "redirects to the auction page" do
        valid_request
        expect(response).to redirect_to auction
      end

    end

    context "with invalid params" do
      def invalid_request
        post :create, bid: {price: -5}, auction_id: auction
      end
      it "doesn't change the bid count" do
        expect { invalid_request }.to_not change { Bid.count }
      end

      it "renders the auctions show page" do
        invalid_request
        expect(response).to render_template("auctions/show")
      end
    end
  end
end
