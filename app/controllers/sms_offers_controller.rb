require "twilio_lib"

class SmsOffersController < ApplicationController

	def send_offer_link
		offer = Offer.find_by(offer_code: params[:Body])
		if offer
			link = "#{request.domain}#{offer_path(offer)}"
		else
			link = "not available"
		end
		
		TwilioLib.send_text(params[:From], link)

		response = Twilio::TwiML::Response.new do |r|
    	end

    	render_twiml response
	end
	
end
