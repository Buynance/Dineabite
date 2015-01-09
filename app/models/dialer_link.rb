class DialerLink < ActiveRecord::Base

  belongs_to :customer

  def create_short_link(request)
    url = Rails.application.routes.url_helpers.url_for controller: 'dialer_links', action: 'show', host: request.host, id: self.id
    self.short_link = Googl.shorten(url).short_url
  end

end
