class OffersController < ApplicationController
	def show
		@offers = Offer.all
	end
	
	def create
		@item = Item.find(params[:item_id]) 
		Offer.create(item_id: @item.id, offerer_id: current_user.id, offer: params[:offer])
		return redirect_to dashboards_path
	end

	def decline
		@offer = Offer.find(params[:id])
		@offer.update(status: 'declined')
		return redirect_to offer_path current_user.id
	end

	def accept
		@offer = Offer.find(params[:id])
		@offer.update(status: "accepted")

		@item = Item.find(@offer.item_id)
		@delivery = Delivery.create(user_id: @offer.offerer_id, item_id: @item.id)

		@item.update(offer: @offer.offer.floor, delivery_id: @delivery.id)
		return redirect_to offer_path current_user.id
	end
end
