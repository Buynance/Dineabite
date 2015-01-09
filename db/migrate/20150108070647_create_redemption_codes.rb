class CreateRedemptionCodes < ActiveRecord::Migration
  def change
    create_table :redemption_codes do |t|
      t.string :code

      t.timestamps
    end
  end
end
