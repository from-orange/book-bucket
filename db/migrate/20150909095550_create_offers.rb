class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :name
      t.integer :buyer_id
      t.integer :seller_id

      t.timestamps null: false
    end
  end
end
