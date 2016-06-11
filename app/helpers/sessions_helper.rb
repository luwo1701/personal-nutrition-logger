module SessionsHelper
	#logs in given user
	def log_in(user)
		session[:user_id]=user.id	
	end
	#returns the current logged in-user if any
	def current_user
		@current||=User.find_by(id: session[:user_id])
	end
end
