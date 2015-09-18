class AddOnSaleToBooks < ActiveRecord::Migration
  def change
    add_column :books, :on_sale, :boolean, default: true
  end
end
