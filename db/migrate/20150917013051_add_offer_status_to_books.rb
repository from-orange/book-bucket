class AddOfferStatusToBooks < ActiveRecord::Migration
  def change
        add_column :books, :deal_end, :boolean, default: false
  end
end
