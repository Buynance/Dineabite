class AddOfferCodeToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :offer_code, :string
  end
end
