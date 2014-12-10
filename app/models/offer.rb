require 'securerandom'
class Offer < ActiveRecord::Base

	before_create :create_offer_code
	belongs_to :business

	def create_offer_code
		self.offer_code = SecureRandom.random_number(999999)
	end

end
