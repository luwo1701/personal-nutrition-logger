class UsersController < ApplicationController
  def index
		render plain: "index works"
	end
	def new
  end
	def create
		@user = User.new(user_params)
		@user.save	
		#redirect_to @user
		render plain: params[:user].inspect
	end
	def show
    @user = User.find(params[:id])                            
  end 

	private
		def user_params
			params.require(:user).permit(:name,:email,:password)
		end
end
