class UserController < ApplicationController
	def show
	  @doctor = Doctor.find(params[:id])
	end

private

	def user_params
	  params.require(:user).permit(:image)
	end
end
