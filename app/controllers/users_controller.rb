class UsersController < ApplicationController
	skip_before_action :require_login, only: [:index, :create]
    before_action :valid_user, only: [:edit, :show, :update, :destroy]

	def index
		if current_user
			redirect_to dashboards_path
		end
	end

	def create
		@user = User.create(form_params)
		if @user.valid?
			session[:user_id] = @user.id
			return redirect_to dashboards_path
		end

		flash[:errors] = @user.errors.full_messages
		return redirect_to :back
	end

	def show
		@user = User.find(current_user.id)
	end

	def update
		@user = User.find(current_user.id)
		@user.update(form_params)
		redirect_to :back
	end

	def wallet
		@user = User.find(current_user.id)
	end

	def deposit
		@user = User.find(current_user.id)
		@balance = @user.balance
		@balance += params[:deposit].to_i
		@user.update(balance: @balance)
		return redirect_to :back
	end


  private
    def form_params
      params.require(:user_form).permit(:first_name, :last_name, :email, :password, :city, :state)
    end

    def valid_user
      if current_user != User.find(params[:id])
        redirect_to "/users/#{current_user.id}"
      end
    end
end