ActiveAdmin.register Offer do

  permit_params :business_id , :image_url , :full_price , :discounted_price , :available_quantity, :remaining_quantity, :favorite, :fine_print

  form do |f|
    columns do
      column do
        f.inputs "Details" do
          f.input :business
          f.input :image_url
          f.input :full_price
          f.input :discounted_price
          f.input :available_quantity
          f.input :remaining_quantity
          f.input :favorite
          f.input :fine_print
        end
        f.actions
      end
      column do
        panel "Preview" do
          render partial: "active_admin/offers/preview"
        end
      end
    end
  end

  show do
  	columns do
      column do
        panel "Basic Information" do
          attributes_table_for offer do
	          row("Business")             {|offer| offer.business.name}
	          row("Image Url")            {|offer| offer.image_url}
	          row("Full Price")           {|offer| offer.full_price}
	          row("Discounted Price")     {|offer| offer.discounted_price}
	          row("Total Quantity")       {|offer| offer.available_quantity}
	          row("Remaining Quantity")   {|offer| offer.remaining_quantity}
	          row("Favorite Section")     {|offer| offer.favorite}
	          row("Fine Print")           {|offer| offer.fine_print}
	          row("Link")                 {|offer| link_to "/offers/#{offer.id}" }
          end
        end
      end
    end
  end


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
