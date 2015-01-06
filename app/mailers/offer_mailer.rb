class OfferMailer < ActionMailer::Base

	def redemption_instructions_demo(email)

		mail :subject => "Redemption Instructions",
        	 :to      => email,
       		 :from    => "Tuglocal <noreply@tuglocal.com>"
	end




	
end

