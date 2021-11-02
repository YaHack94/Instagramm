class AccountsController < ApplicationController
	before_action :authenticate_user!, only: [:show]

	def index

		@publication = Publication.new
		@publications = Publication.all
		@users = User.all 
		@user = User.find_by(id:session[:current_user_id])
		render layout: "application2"
		
	end

	def create 
		@publication = Publication.new(pub_params)
		@publication.user_id = session[:current_user_id]
		@publication.active = true

		if @publication.save
		  session[:current_publication_id] = @publication.id
		  flash[:pub_success] = "Post publié avec succès"
	      redirect_to '/dashboard'
	    else
	      flash[:pub_errors] = @publication.errors.full_messages
	      redirect_to '/dashboard'
	    end
	end

	private

	  def pub_params
	    params.require(:publication).permit(:image)
      end
end
