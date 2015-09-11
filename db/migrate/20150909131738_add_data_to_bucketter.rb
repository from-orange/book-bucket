class AddDataToBucketter < ActiveRecord::Migration
  def change
    add_column :bucketters, :address, :string
    add_column :bucketters, :first_name, :string
    add_column :bucketters, :last_name, :string
    add_column :bucketters, :card_num, :integer
  end
end
