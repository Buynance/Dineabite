class Customer < ActiveRecord::Base
  has_many :dialer_links
  accepts_nested_attributes_for :dialer_links, allow_destroy: true
  
end
