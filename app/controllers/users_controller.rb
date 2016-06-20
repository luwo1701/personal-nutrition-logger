class UsersController < ApplicationController
  def index
	end
	def new
  end
	def create
		@user = User.create(user_params)
		log_in(@user)
		redirect_to @user
	end
	def show
		@user = User.find(params[:id])    
		@foods = @user.foods.paginate(page:params[:page])
	end 

	private
		def user_params
			params.require(:user).permit(:name,:email,:password)
		end
end
