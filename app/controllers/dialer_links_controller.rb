class DialerLinksController < ApplicationController

  def show
    @dialer_link = DialerLink.find_by(id: params[:id])

    redirect_to @dialer_link.root_link
  end

end
