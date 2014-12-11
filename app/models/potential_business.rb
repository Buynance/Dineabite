require 'valid_email'
require 'twilio_lib'
class PotentialBusiness < ActiveRecord::Base
	
	before_save :parse_phone_number
	after_create :send_signup_notification

	validates :first_name,
	presence: {message: "Please include your first name."},
	on: :create

	validates :last_name,
	presence: {message: "Please include your last name."},
	on: :create

	validates :business_name,
	presence: {message: "Please include your business name."},
	on: :create

	validates :phone_number,
	presence: {message: "Please include a valid phone number."},
	on: :create

	validates :email, 
	:presence => {message: "Please include your email."}, 
	:email => true


	def parse_phone_number
        phone_number_object = GlobalPhone.parse(self.phone_number)
        phone_number_object = nil if (phone_number_object != nil and phone_number_object.territory.name != "US")

        if phone_number_object.nil? or self.phone_number.length < 10
          self.phone_number = nil
        else
          self.phone_number = phone_number_object.international_string
        end 
    end

    def send_signup_notification
    	#if Rails.env.production?
    		#TwilioLib.send_text("7169085466", "A business has signed up to tuglocal. Name: #{self.first_name} #{self.owner_last_name}. Business Name: #{self.business_name}. Phone Number: #{self.phone_number}") 
      		#TwilioLib.send_text("7169087957", "A business has signed up to tuglocal. Name: #{self.first_name} #{self.owner_last_name}. Business Name: #{self.business_name}. Phone Number: #{self.phone_number}")
    		TwilioLib.send_text("3473567903", "A business has signed up to tuglocal. Name: #{self.first_name} #{self.last_name}. Business Name: #{self.business_name}. Phone Number: #{self.phone_number}")
    	#end
    end


end
