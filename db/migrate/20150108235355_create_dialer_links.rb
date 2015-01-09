class CreateDialerLinks < ActiveRecord::Migration
  def change
    create_table :dialer_links do |t|
      t.string  :root_link
      t.integer :delay
      t.string  :short_link
      t.integer :customer_id

      t.timestamps
    end
  end
end
