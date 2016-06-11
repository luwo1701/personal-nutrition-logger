class SessionsController < ApplicationController
  def new
  end
	def create
		#render plain: params[:session].inspect
		#find the users input in our users model (note: params is a hash)
		user=User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			log_in(user)
			redirect_to user #sends to path "users/:id"
		else
			flash.now[:danger] = "The user name and password do not match"
			render 'new'
		end
	end
	def destroy
	end
end
