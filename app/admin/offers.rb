ActiveAdmin.register Offer do


  index do 
    column("Created At", :sortable => :created_at) {|offer| business.created_at.strftime("%m/%d/%Y %I:%M%p")}
    column("Id", :sortable => :id)                 {|offer| link_to "#{offer.id}", admin_offer_path(offer)}
    column("Business")                             {|offer| offer.business.name}
    column("Full Price")                           {|offer| offer.full_price}
    column("Discounted Price")                     {|offer| offer.discounted_price}
    column("Remaining Quantity")                   {|offer| offer.remaining_quantity}
    actions
  end


end
