class OffersController < ApplicationController

	layout "offers"

	def show
		@offer = Offer.find(params[:id])

	end

	def demo
		
	end

	
	def create_offer
		offer = Offer.find_by(offer_code: params[:offer_code])
		unless offer
			new_offer = Offer.create(offer_code: params[:offer_code])
			if new_offer
				data = "#{new_offer}"
			else
				data = "Error: Offer impossible to create."
			end
		else
			data = "Offer already exist"
		end
		render plain: data
	end
end