class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :business_id
      t.string :image_url
      t.integer :full_price
      t.integer :discounted_price
      t.integer :available_quantity
      t.integer :remaining_quantity
      t.string :name
      t.string :short_description
      t.text :long_description

      t.timestamps
    end
  end
end
