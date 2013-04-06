class AgerestrictionsController < ApplicationController
	respond_to :html, :json
	load_and_authorize_resource :agerestriction

	def index
		@agerestrictions = Agerestriction.all
		respond_with(@agerestrictions)
	end
	
	def show
		@agerestriction = Agerestriction.find(params[:id])
		respond_with(@agerestriction)
	end

	def edit
		respond_with(@agerestriction)
	end

	def update
		@agerestriction.update_attributes(params[:agerestriction])
		@agerestriction.save
		respond_with(@agerestriction)
	end
	
	def new
				
	end

	def create
		@agerestriction = Agerestriction.create(params[:agerestriction])
	end

	

end
