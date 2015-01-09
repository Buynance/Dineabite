class CustomersController < ApplicationController

  def new
    @customer = Customer.new
    @customer.dialer_links.build
  end

  def create
    @customer = Customer.create(customer_link_params)
    @link = @customer.dialer_links.last
    @link.create_short_link(request)
    @link.save
    if @customer
      redirect_to "/"
    else
      render :new
    end 
  end

  private

  def customer_link_params
    params.require(:customer).permit(:first_name, :last_name, :phone_number, :dialer_links_attributes => [:root_link, :delay])
  end

end
