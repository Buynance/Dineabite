require 'securerandom'
require 'twilio_lib'
class Offer < ActiveRecord::Base

	before_create :create_offer_code
	belongs_to :business, inverse_of: :offers

	def create_offer_code
		self.offer_code = SecureRandom.random_number(999999)
	end

	def self.send_redemption_instructions(fullname)
		email = nil
		phone_number = nil
		if fullname.downcase == "edwin velasquez"
			email = "edwin@buynance.com"
			phone_number = "+13473567903"
		elsif fullname.downcase == "jay ballentine"
			email = "jay@buynance.com"
			phone_number = "+17169085466"
		elsif fullname.downcase == "yuliya glazman"
			email = "yuliya@buynance.com"
			phone_number = "+17169087957"
		end
		
		OfferMailer.redemption_instructions_demo(email).deliver! unless email.nil?
		TwilioLib.send_text(phone_number, "Some text about redemption") unless phone_number.nil?

	end

end
