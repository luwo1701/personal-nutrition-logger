class SessionsController < ApplicationController
  def new
  end
	def create
	      render plain: params[:session].inspect
	end
end
