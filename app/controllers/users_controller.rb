class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	#debugger => This stops the rails terminal to examine the situation, to continue press Ctrl+D
  end
  
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		#Handle a successfully save
  	else
  		render 'new'
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

end
