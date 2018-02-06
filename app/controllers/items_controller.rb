class ItemsController < ApplicationController

	def show
		@item = Item.find(params[:id])
		@owner = User.find(@item.user_id)
	end

	def new
	end

	def create
		@item = Item.create(item_params)
		if @item.valid?
			return redirect_to dashboard_path current_user.id
		else
			flash[:errors] = @item.errors.full_messages
			return redirect_to :back
		end
	end

	def update
		@item = Item.find(params[:id])
		@delivery = Delivery.create(user_id: current_user.id, item_id: @item.id)
		@item.update(delivery_id: @delivery.id)
		redirect_to dashboard_path current_user.id
	end

	def del_confirm
		@user = User.find(current_user.id)
		@user_bal = @user.balance
		@delivery = Delivery.find(params[:delivery_id])
		@user_bal += @delivery.item.offer.to_i
		p @user_bal
		@user.update(balance: @user_bal)

		@item_user = User.find(@delivery.item.user.id)

		@item_user_withdrawal = @item_user.balance - @delivery.item.offer.to_i

		@item_user.update(balance: @item_user_withdrawal)
		
		@delivery.update(delivered: "true")

		redirect_to dashboard_path current_user.id
	end

	def del_cancel
		@delivery = Delivery.find(params[:delivery_id])
		@item = Item.find(params[:item_id])
		@item.update(delivery_id: nil)
		@delivery.destroy
		redirect_to dashboard_path current_user.id
	end

	private
	  def item_params
		params.require(:item_form).permit(:name, :description, :city, :state, :del_city, :del_state, :offer).merge(user_id: current_user.id)
	  end
end
