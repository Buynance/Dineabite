class AddFavoriteAndFinePrintToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :favorite, :text
    add_column :offers, :fine_print, :text
  end
end
