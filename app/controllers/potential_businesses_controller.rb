class PotentialBusinessesController < ApplicationController
	
	def new
		@potential_business = PotentialBusiness.new
	end

	def create
		@potential_business = PotentialBusiness.new(potential_business_params)
		if @potential_business.save
			redirect_to @potential_business
		else
			render :new
		end
	end

	def show
	
	end

	private

	def potential_business_params
      return params.require(:potential_business).permit(:first_name, :last_name, :email, :phone_number, :business_name) 
    end

end
