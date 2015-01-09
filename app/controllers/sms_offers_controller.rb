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

	def check_offer_code
		code = parmas[:Body]
		if code == "3878"
			validation_message = "This offer is valid."
		else
			validation_message = "This offer is invalid."
		end

		TwilioLib.send_text(params[:From], validation_message)

		response = Twilio::TwiML::Response.new do |r|
    end

    render_twiml response
	end

	def send_redemption_email
		fullname = params[:fullname]
		Offer.send_redemption_instructions(fullname)
		render :nothing => true
	end

	def redeem_offer
		offer_code = params[:Body].capitalize
		is_valid = offer_code.length == 8 and RedemptionCode.find_by(code: offer_code).nil?

		if is_valid
			RedemptionCode.create(code: offer_code)
			TwilioLib.send_text(params[:From], "Valid! The offer code (#{offer_code}) is valid and has been redeemed.")
		else
				TwilioLib.send_text(params[:From], "Invalid! The offer code (#{offer_code}) is invalid")
		end 

		response = Twilio::TwiML::Response.new do |r|
    end

    render_twiml response

	end
	
end
