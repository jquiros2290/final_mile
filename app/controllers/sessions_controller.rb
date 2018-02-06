class SessionsController < ApplicationController
	skip_before_action :require_login, only: [:create]
	
	def create
	user = User.find_by(email: params[:email])

	if user
		if user.try(:authenticate, params[:password])
			session[:user_id] = user.id
			return redirect_to dashboards_path
		end
			flash[:errors] = ["Password is incorrect"]
		else
			flash[:errors] = ["Email is incorrect"]
		end

		return redirect_to :back
	end

	def destroy
		reset_session
		redirect_to users_path
	end
end
