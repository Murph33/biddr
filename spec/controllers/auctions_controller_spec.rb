require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do

  describe "#new" do

    it "assigns an instance variable @auction" do
      get :new

      expect(assigns(:auction)).to be_a_new Auction
    end

    it "renders new.html.erb template file" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do

    context "with valid attributes" do
      def valid_request
        post :create, auction: {title:         "some title",
                                details:       "some details",
                                ends_on:       3.days.from_now,
                                reserve_price: 5000}
      end

      it "save a user record in the database" do

        expect { valid_request }.to change { Auction.count }.by(1)

      end

      it "redirects to auction show page" do

        valid_request
        expect(response).to redirect_to(Auction.first)

      end

      it "sets a flash message" do
        valid_request
        expect(flash[:notice]).to be
      end


    end
    context "with invalid attributes" do

      def invalid_request
        post :create, auction: {title: "nothing"}
      end

      it "renders the auction new page" do

        invalid_request
        expect(response).to render_template(:new)
      end
    end

  end
end
