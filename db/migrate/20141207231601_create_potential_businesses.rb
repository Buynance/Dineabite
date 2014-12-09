class CreatePotentialBusinesses < ActiveRecord::Migration
  def change
    create_table :potential_businesses do |t|
      t.string :first_name
      t.string :last_name
      t.string :business_name
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
