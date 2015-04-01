
class UsersController < ApplicationController
	before_filter :authorize
#is there a current user? Are we really signed in. The current_user is a method inherited from the Application Controller

	def show
		@user = User.find(params[:id])
		if current_user.admin?
			render :show
		elsif current_user.id != params[:id].to_i
			flash[:dumbass] = "You are not authorized to access this page"
			redirect_to login_path
		else
			render :show
		#new view in sessions bc i'm going to the login_path
		end
	end

  private

	def authorize
		if current_user.nil?   		#if not signed_in?
			flash[:alert] = "Not authorized"
			redirect_to login_path
		end
	end


end