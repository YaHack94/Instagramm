class UsersController < ApplicationController

	def index
		
	end

	def new
    
  	end

	def create
		@user = User.new(user_params)
		if @user.save
      		session[:current_user_id] = @user.id
      		redirect_to '/dashboard'
    	else
      		flash[:register_errors] = @user.errors.full_messages
      		redirect_to '/'
    	end
	end

	def update
	  	@user = User.find(params[:id])
	  	if @user.update(user2_params)
	  		#@user.update(surname: params[:surname])
	  		#@user.update(email: params[:email])
	  		#@user.update(image: params[:image])
	  		redirect_to '/dashboard'
  		else
  			render "accounts/edit"
  		end
  	end 


	private

	    def user_params
	      params.require(:user).permit(:name, :surname, :image, :email, :password, :password_confirmation)
	    end

	    def user2_params
	      params.require(:user).permit(:name, :surname, :image, :email)
	    end
end
