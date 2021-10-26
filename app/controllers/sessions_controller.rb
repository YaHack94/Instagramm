class SessionsController < ApplicationController
	before_action :authenticate_user!, only: [:show]

  def create
    @user = User.find_by(email:login_params[:email])
    if @user && @user.authenticate(login_params[:password])
      session[:current_user_id] = @user.id
      redirect_to '/dashboard'
    else
      flash[:login_errors] = ['User Name or Password is not correct']
      redirect_to '/'
    end
  end

  def destroy
    session[:current_user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to '/'

  end

  private
    def login_params
      params.require(:login).permit(:email, :password)
    end

end
