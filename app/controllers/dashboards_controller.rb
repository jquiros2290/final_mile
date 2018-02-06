class DashboardsController < ApplicationController
    before_action :valid_user, only: [:show]

	def index
		@instate = Item.all.where(state: current_user.state, delivery_id: nil)
		@outstate = Item.all.where.not(state: current_user.state)
	end

	def show
		@user = current_user
		@deliveries = Delivery.all.where(user_id: current_user.id)
	end

	private
	  def valid_user
        if current_user != User.find(params[:id])
          redirect_to "/dashboards/#{current_user.id}"
        end
    end
end
