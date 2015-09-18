class AddBookIdToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :book_id, :integer
  end
end
